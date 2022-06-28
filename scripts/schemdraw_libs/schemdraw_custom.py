#!/usr/bin/env python3

import schemdraw.dsp as dsp
import schemdraw.elements as elm
from schemdraw.segments import Segment
from schemdraw.segments import SegmentText
from schemdraw.elements import IcPin
from schemdraw.elements.twoterm import reswidth
import math



class Dac2(dsp.Dac):
    ''' Digital to analog converter
        NOTE: Adding 2nd input to support clk
    '''
    def __init__(self, *d, **kwargs):
        super().__init__(*d, **kwargs)
        self.anchors['clk'] = (0, -0.25)

class RFDac(dsp.Circle):
    ''' Digital to analog converter
        NOTE: Adding 2nd input to support clk

        Anchors:
            in1: din to DAC
            in2: CLK to DAC
            N,E,S,W: I/O to mixer
    '''
    def __init__(self, *d, N: str=None, E: str=None, S: str=None, W: str=None,
                 font: str=None, fontsize: float=10, **kwargs):
        super().__init__(*d, **kwargs)
        rad = .5
        k = rad*math.sqrt(2)/2  # Diagonal distance
        self.segments.append(Segment([(rad+k, k), (rad-k, -k)], lw=1))
        self.segments.append(Segment([(rad+k, -k), (rad-k, k)], lw=1))
        self.segments.append(Segment([(rad-k, k), (-rad/2, 1.5*rad)], lw=2))
        self.segments.append(Segment([(-rad/2, 1.5*rad), (-rad*4, 1.5*rad)], lw=2))
        self.segments.append(Segment([(-rad*4, 1.5*rad), (-rad*4, -1.5*rad)], lw=2))
        self.segments.append(Segment([(-rad*4, -1.5*rad), (-rad/2, -1.5*rad)], lw=2))
        self.segments.append(Segment([(-rad/2, -1.5*rad), (rad-k, -k)], lw=2))
        self.params['lblloc'] = 'top'
        self.params['lblofst'] = 0.2

        if N:
            self.segments.append(SegmentText(
                (rad, rad/2+0.01), N,
                font=font, fontsize=fontsize))
        if S:
            self.segments.append(SegmentText(
                (rad, -rad/2-0.065), S,
                font=font, fontsize=fontsize))
        if E:
            self.segments.append(SegmentText(
                (rad*1.5+0.05, 0), E,
                font=font, fontsize=fontsize))
        if W:
            self.segments.append(SegmentText(
                (rad/2-0.05, 0), W,
                font=font, fontsize=fontsize))

        self.params['lblloc'] = 'center'
        self.params['lblofst'] = 0
        self.params['in1'] = (-rad*4, 0)
        self.anchors['in1'] = (-rad*4, 0)
        self.params['in2'] = (-rad*4, -k)
        self.anchors['in2'] = (-rad*4, -k)

fetw = reswidth*4
feth = reswidth*5
fetl = feth/2
fetgap = reswidth
fetr = reswidth*.7  # Radius of "not" bubble

class NFet3(elm.Element):
    ''' N-type Field Effect Transistor

        Args:
            bulk: Draw bulk contact

        Anchors:
            * source
            * drain
            * gate
    '''
    def __init__(self, *d, bulk: bool=False, **kwargs):
        super().__init__(*d, **kwargs)
        self.segments.append(Segment([
                                  (0, -fetl),
                                  (fetw, -fetl),
                                  (fetw, -fetl/2),
                                  (fetw, (-fetl-fetw)*1.18)]))

        self.segments.append(Segment([
                                  (fetw, -fetl-fetw),
                                  (0, -fetl-fetw)], arrow='->', arrowwidth=0.3, arrowlength=0.2))

        self.segments.append(Segment([
                                  (0, -fetl-fetw),
                                  (0, -2*fetl-fetw)]))

        self.segments.append(Segment([(fetw+fetgap, -fetl),
                                      (fetw+fetgap, -fetl-fetw)]))
        self.segments.append(Segment([(fetw+fetgap, -fetl-fetw/2),
                                      (fetw+fetgap+fetl+fetr, -fetl-fetw/2)]))

        self.anchors['source'] = (0, -2*fetl-fetw)
        self.anchors['drain'] = (0, -fetl)
        self.anchors['gate'] = (fetw+fetgap+fetl+fetr, -fetl-fetw/2)
        self.params['drop'] = (0, -2*fetl-fetw)
        self.params['lblloc'] = 'lft'
        if bulk:
            self.segments.append(Segment([(0, -fetl-fetw/2), (fetw, -fetl-fetw/2)],
                                         arrow='->', arrowwidth=.2))
            self.anchors['bulk'] = (0, -fetl-fetw/2)

class AdcWithClk(dsp.Adc):
    def __init__(self, *d, **kwargs):
        super().__init__(*d, **kwargs)
        self.segments.append(Segment([(0, 0), (0.22, -0.5), (0.65, -0.5),
                                      (0.75, -0.4), (0.85, -0.5)]))
        self.anchors['S'] = (0, -0.5)


class B2TEncode(elm.Ic):
    def __init__(self, *d, size=(2, 3), **kwargs):
        pins = [IcPin('$D_{in}$', side='left', slot='2/3'),
                IcPin('>', side='bottom', slot='2/3'),
                IcPin('$T_{out}$', side='right', slot='2/3')
               ]

        super().__init__(pins=pins, size=size)
