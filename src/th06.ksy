meta:
  id: th06
  file-extension: rpy
  endian: le
seq:
  - id: header
    type: header
  - id: file_header
    type: file_header
  - id: stages
    type: stage_instance(_index)
    repeat: expr
    repeat-expr: 7
types:
  dummy:
    doc: blank type
  header:
    seq:
      - id: magic
        contents: T6RP
      - id: version
        size: 2
      - id: shot
        type: u1
      - id: difficulty
        type: u1
      - id: checksum
        type: u4
      - id: unknown
        size: 2
      - id: key
        type: u1
  file_header:
    seq:
      - id: unknown_2
        type: u1
      - id: date
        type: str
        size: 9
        encoding: ASCII
        terminator: 0x0
      - id: name
        type: str
        size: 9
        encoding: SJIS
        terminator: 0x0
      - id: unknown_3
        type: u2
      - id: score
        type: u4
      - id: unknown_4
        type: u4
      - id: slowdown
        type: f4
      - id: unknown_5
        type: u4
      - id: stage_offsets
        type: u4
        repeat: expr
        repeat-expr: 7
  stage:
    seq:
      - id: score
        type: u4
      - id: seed
        type: u2
      - id: unknown_1
        type: u2
      - id: power
        type: u1
      - id: lives
        type: s1
      - id: bombs
        type: s1
      - id: rank
        type: u1
  stage_instance:
    params:
      - id: idx
        type: u4
    instances:
      body:
        pos: _parent.file_header.stage_offsets[idx]
        type:
          switch-on: _parent.file_header.stage_offsets[idx]
          cases:
            0: dummy
            _: stage
