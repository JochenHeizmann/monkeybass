Strict

Import "native/bassglue.java"

Global  BASSVERSIONTEXT$ = "2.4"

' Error codes returned by BASS_ErrorGetCode
Global  BASS_OK% = 0 ' all is OK
Global  BASS_ERROR_MEM% = 1	' memory error
Global  BASS_ERROR_FILEOPEN% = 2	' can't open the file
Global  BASS_ERROR_DRIVER% = 3	' can't find a free/valid driver
Global  BASS_ERROR_BUFLOST% = 4	' the sample buffer was lost
Global  BASS_ERROR_HANDLE% = 5	' invalid handle
Global  BASS_ERROR_FORMAT% = 6	' unsupported sample format
Global  BASS_ERROR_POSITION% = 7	' invalid position
Global  BASS_ERROR_INIT% = 8	' BASS_Init has not been successfully called
Global  BASS_ERROR_START% = 9	' BASS_Start has not been successfully called
Global  BASS_ERROR_ALREADY% = 14	' already initialized/paused/whatever
Global  BASS_ERROR_NOCHAN% = 18	' can't get a free channel
Global  BASS_ERROR_ILLTYPE% = 19	' an illegal type was specified
Global  BASS_ERROR_ILLPARAM% = 20	' an illegal parameter was specified
Global  BASS_ERROR_NO3D% = 21	' no 3D support
Global  BASS_ERROR_NOEAX% = 22	' no EAX support
Global  BASS_ERROR_DEVICE% = 23	' illegal device number
Global  BASS_ERROR_NOPLAY% = 24	' not playing
Global  BASS_ERROR_FREQ% = 25	' illegal sample rate
Global  BASS_ERROR_NOTFILE% = 27	' the stream is not a file stream
Global  BASS_ERROR_NOHW% = 29	' no hardware voices available
Global  BASS_ERROR_EMPTY% = 31	' the MOD music has no sequence data
Global  BASS_ERROR_NONET% = 32	' no internet connection could be opened
Global  BASS_ERROR_CREATE% = 33	' couldn't create the file
Global  BASS_ERROR_NOFX% = 34	' effects are not available
Global  BASS_ERROR_NOTAVAIL% = 37	' requested data is not available
Global  BASS_ERROR_DECODE% = 38	' the channel is a "decoding channel"
Global  BASS_ERROR_DX% = 39	' a sufficient DirectX version is not installed
Global  BASS_ERROR_TIMEOUT% = 40	' connection timedout
Global  BASS_ERROR_FILEFORM% = 41	' unsupported file format
Global  BASS_ERROR_SPEAKER% = 42	' unavailable speaker
Global  BASS_ERROR_VERSION% = 43	' invalid BASS version (used by add-ons)
Global  BASS_ERROR_CODEC% = 44	' codec is not available/supported
Global  BASS_ERROR_ENDED% = 45	' the channel/file has ended
Global  BASS_ERROR_BUSY% = 46	' the device is busy
Global  BASS_ERROR_UNKNOWN% = -1	' some other mystery problem

Global  BASS_ERROR_JAVA_CLASS% = 2000	' object class problem

' BASS_SetConfig options
Global  BASS_CONFIG_BUFFER% = 0
Global  BASS_CONFIG_UPDATEPERIOD% = 1
Global  BASS_CONFIG_GVOL_SAMPLE% = 4
Global  BASS_CONFIG_GVOL_STREAM% = 5
Global  BASS_CONFIG_GVOL_MUSIC% = 6
Global  BASS_CONFIG_CURVE_VOL% = 7
Global  BASS_CONFIG_CURVE_PAN% = 8
Global  BASS_CONFIG_FLOATDSP% = 9
Global  BASS_CONFIG_3DALGORITHM% = 10
Global  BASS_CONFIG_NET_TIMEOUT% = 11
Global  BASS_CONFIG_NET_BUFFER% = 12
Global  BASS_CONFIG_PAUSE_NOPLAY% = 13
Global  BASS_CONFIG_NET_PREBUF% = 15
Global  BASS_CONFIG_NET_PASSIVE% = 18
Global  BASS_CONFIG_REC_BUFFER% = 19
Global  BASS_CONFIG_NET_PLAYLIST% = 21
Global  BASS_CONFIG_MUSIC_VIRTUAL% = 22
Global  BASS_CONFIG_VERIFY% = 23
Global  BASS_CONFIG_UPDATETHREADS% = 24
Global  BASS_CONFIG_DEV_BUFFER% = 27
Global  BASS_CONFIG_DEV_DEFAULT% = 36
Global  BASS_CONFIG_NET_READTIMEOUT% = 37
Global  BASS_CONFIG_HANDLES% = 41
Global  BASS_CONFIG_SRC% = 43
Global  BASS_CONFIG_SRC_SAMPLE% = 44

' BASS_SetConfigPtr options
Global  BASS_CONFIG_NET_AGENT% = 16
Global  BASS_CONFIG_NET_PROXY% = 17

' BASS_Init flags
Global  BASS_DEVICE_8BITS% = 1	' 8 bit resolution, else 16 bit
Global  BASS_DEVICE_MONO% = 2	' mono, else stereo
Global  BASS_DEVICE_3D% = 4	' enable 3D functionality
Global  BASS_DEVICE_LATENCY% = $100	' calculate device latency (BASS_INFO struct)
Global  BASS_DEVICE_SPEAKERS% = $800 ' force enabling of speaker assignment
Global  BASS_DEVICE_NOSPEAKER% = $1000 ' ignore speaker arrangement
Global  BASS_DEVICE_FREQ% = $4000 ' set device sample rate

' BASS_DEVICEINFO flags
Global  BASS_DEVICE_ENABLED% = 1
Global  BASS_DEVICE_DEFAULT% = 2
Global  BASS_DEVICE_INIT% = 4

Global  BASS_SAMPLE_8BITS% = 1		' 8 bit
Global  BASS_SAMPLE_FLOAT% = 256	' 32-bit floating-point
Global  BASS_SAMPLE_MONO% = 2		' mono
Global  BASS_SAMPLE_LOOP% = 4		' looped
Global  BASS_SAMPLE_3D% = 8			' 3D functionality
Global  BASS_SAMPLE_SOFTWARE% = 16	' not using hardware mixing
Global  BASS_SAMPLE_MUTEMAX% = 32	' mute at max distance (3D only)
Global  BASS_SAMPLE_VAM% = 64		' DX7 voice allocation & management
Global  BASS_SAMPLE_FX% = 128		' old implementation of DX8 effects
Global  BASS_SAMPLE_OVER_VOL% = $10000	' override lowest volume
Global  BASS_SAMPLE_OVER_POS% = $20000	' override longest playing
Global  BASS_SAMPLE_OVER_DIST% = $30000 ' override furthest from listener (3D only)

Global  BASS_STREAM_PRESCAN% = $20000	' enable pin-point seeking/length (MP3/MP2/MP1)
Global  BASS_MP3_SETPOS% = BASS_STREAM_PRESCAN
Global  BASS_STREAM_AUTOFREE% = $40000	' automatically free the stream when it stop/ends
Global  BASS_STREAM_RESTRATE% = $80000	' restrict the download rate of internet file streams
Global  BASS_STREAM_BLOCK% = $100000	' download/play internet file stream in small blocks
Global  BASS_STREAM_DECODE% = $200000	' don't play the stream, only decode (BASS_ChannelGetData)
Global  BASS_STREAM_STATUS% = $800000	' give server status info (HTTP/ICY tags) in DOWNLOADPROC

Global  BASS_MUSIC_FLOAT% = BASS_SAMPLE_FLOAT
Global  BASS_MUSIC_MONO% = BASS_SAMPLE_MONO
Global  BASS_MUSIC_LOOP% = BASS_SAMPLE_LOOP
Global  BASS_MUSIC_3D% = BASS_SAMPLE_3D
Global  BASS_MUSIC_FX% = BASS_SAMPLE_FX
Global  BASS_MUSIC_AUTOFREE% = BASS_STREAM_AUTOFREE
Global  BASS_MUSIC_DECODE% = BASS_STREAM_DECODE
Global  BASS_MUSIC_PRESCAN% = BASS_STREAM_PRESCAN	' calculate playback length
Global  BASS_MUSIC_CALCLEN% = BASS_MUSIC_PRESCAN
Global  BASS_MUSIC_RAMP% = $200	' normal ramping
Global  BASS_MUSIC_RAMPS% = $400	' sensitive ramping
Global  BASS_MUSIC_SURROUND% = $800	' surround sound
Global  BASS_MUSIC_SURROUND2% = $1000	' surround sound (mode 2)
Global  BASS_MUSIC_FT2MOD% = $2000	' play .MOD as FastTracker 2 does
Global  BASS_MUSIC_PT1MOD% = $4000	' play .MOD as ProTracker 1 does
Global  BASS_MUSIC_NONINTER% = $10000	' non-interpolated sample mixing
Global  BASS_MUSIC_SINCINTER% = $800000 ' sinc interpolated sample mixing
Global  BASS_MUSIC_POSRESET% = $8000	' stop all notes when moving position
Global  BASS_MUSIC_POSRESETEX% = $400000 ' stop all notes and reset bmp/etc when moving position
Global  BASS_MUSIC_STOPBACK% = $80000	' stop the music on a backwards jump effect
Global  BASS_MUSIC_NOSAMPLE% = $100000 ' don't load the samples

' Speaker assignment flags
Global  BASS_SPEAKER_FRONT% = $1000000	' front speakers
Global  BASS_SPEAKER_REAR% = $2000000	' rear/side speakers
Global  BASS_SPEAKER_CENLFE% = $3000000	' center & LFE speakers (5.1)
Global  BASS_SPEAKER_REAR2% = $4000000	' rear center speakers (7.1)
Global  BASS_SPEAKER_LEFT% = $10000000	' modifier: left
Global  BASS_SPEAKER_RIGHT% = $20000000	' modifier: right
Global  BASS_SPEAKER_FRONTLEFT% = BASS_SPEAKER_FRONT|BASS_SPEAKER_LEFT
Global  BASS_SPEAKER_FRONTRIGHT% = BASS_SPEAKER_FRONT|BASS_SPEAKER_RIGHT
Global  BASS_SPEAKER_REARLEFT% = BASS_SPEAKER_REAR|BASS_SPEAKER_LEFT
Global  BASS_SPEAKER_REARRIGHT% = BASS_SPEAKER_REAR|BASS_SPEAKER_RIGHT
Global  BASS_SPEAKER_CENTER% = BASS_SPEAKER_CENLFE|BASS_SPEAKER_LEFT
Global  BASS_SPEAKER_LFE% = BASS_SPEAKER_CENLFE|BASS_SPEAKER_RIGHT
Global  BASS_SPEAKER_REAR2LEFT% = BASS_SPEAKER_REAR2|BASS_SPEAKER_LEFT
Global  BASS_SPEAKER_REAR2RIGHT% = BASS_SPEAKER_REAR2|BASS_SPEAKER_RIGHT

Global  BASS_RECORD_PAUSE% = $8000	' start recording paused

' BASS_CHANNELINFO types
Global  BASS_CTYPE_SAMPLE% = 1
Global  BASS_CTYPE_RECORD% = 2
Global  BASS_CTYPE_STREAM% = $10000
Global  BASS_CTYPE_STREAM_OGG% = $10002
Global  BASS_CTYPE_STREAM_MP1% = $10003
Global  BASS_CTYPE_STREAM_MP2% = $10004
Global  BASS_CTYPE_STREAM_MP3% = $10005
Global  BASS_CTYPE_STREAM_AIFF% = $10006
Global  BASS_CTYPE_STREAM_CA% = $10007
Global  BASS_CTYPE_STREAM_MF% = $10008
Global  BASS_CTYPE_STREAM_WAV% = $40000 ' WAVE flag, LOWORD=codec
Global  BASS_CTYPE_STREAM_WAV_PCM% = $50001
Global  BASS_CTYPE_STREAM_WAV_FLOAT% = $50003
Global  BASS_CTYPE_MUSIC_MOD% = $20000
Global  BASS_CTYPE_MUSIC_MTM% = $20001
Global  BASS_CTYPE_MUSIC_S3M% = $20002
Global  BASS_CTYPE_MUSIC_XM% = $20003
Global  BASS_CTYPE_MUSIC_IT% = $20004
Global  BASS_CTYPE_MUSIC_MO3% = $00100 ' MO3 flag
' 3D channel modes
Global  BASS_3DMODE_NORMAL% = 0	' normal 3D processing
Global  BASS_3DMODE_RELATIVE% = 1	' position is relative to the listener
Global  BASS_3DMODE_OFF% = 2	' no 3D processing

' software 3D mixing algorithms (used with BASS_CONFIG_3DALGORITHM)
Global  BASS_3DALG_DEFAULT% = 0
Global  BASS_3DALG_OFF% = 1
Global  BASS_3DALG_FULL% = 2
Global  BASS_3DALG_LIGHT% = 3

Global  BASS_STREAMPROC_END% = $80000000	' end of user stream flag

' special STREAMPROCs
Global  STREAMPROC_DUMMY% = 0		' "dummy" stream
Global  STREAMPROC_PUSH% = -1		' push stream

' BASS_StreamCreateFileUser file systems
Global  STREAMFILE_NOBUFFER% = 0
Global  STREAMFILE_BUFFER% = 1
Global  STREAMFILE_BUFFERPUSH% = 2

' BASS_StreamPutFileData options
Global  BASS_FILEDATA_END% = 0	' end & close the file

' BASS_StreamGetFilePosition modes
Global  BASS_FILEPOS_CURRENT% = 0
Global  BASS_FILEPOS_DECODE% = BASS_FILEPOS_CURRENT
Global  BASS_FILEPOS_DOWNLOAD% = 1
Global  BASS_FILEPOS_END% = 2
Global  BASS_FILEPOS_START% = 3
Global  BASS_FILEPOS_CONNECTED% = 4
Global  BASS_FILEPOS_BUFFER% = 5
Global  BASS_FILEPOS_SOCKET% = 6

' BASS_ChannelSetSync types
Global  BASS_SYNC_POS% = 0
Global  BASS_SYNC_END% = 2
Global  BASS_SYNC_META% = 4
Global  BASS_SYNC_SLIDE% = 5
Global  BASS_SYNC_STALL% = 6
Global  BASS_SYNC_DOWNLOAD% = 7
Global  BASS_SYNC_FREE% = 8
Global  BASS_SYNC_SETPOS% = 11
Global  BASS_SYNC_MUSICPOS% = 10
Global  BASS_SYNC_MUSICINST% = 1
Global  BASS_SYNC_MUSICFX% = 3
Global  BASS_SYNC_OGG_CHANGE% = 12
Global  BASS_SYNC_MIXTIME% = $40000000	' FLAG: sync at mixtime, else at playtime
Global  BASS_SYNC_ONETIME% = $80000000	' FLAG: sync only once, else continuously

' BASS_ChannelIsActive return values
Global  BASS_ACTIVE_STOPPED% = 0
Global  BASS_ACTIVE_PLAYING% =1
Global  BASS_ACTIVE_STALLED% = 2
Global  BASS_ACTIVE_PAUSED% = 3

' Channel attributes
Global  BASS_ATTRIB_FREQ% = 1
Global  BASS_ATTRIB_VOL% = 2
Global  BASS_ATTRIB_PAN% = 3
Global  BASS_ATTRIB_EAXMIX% = 4
Global  BASS_ATTRIB_NOBUFFER% = 5
Global  BASS_ATTRIB_CPU% = 7
Global  BASS_ATTRIB_SRC% = 8
Global  BASS_ATTRIB_NET_RESUME% = 9
Global  BASS_ATTRIB_MUSIC_AMPLIFY% = $100
Global  BASS_ATTRIB_MUSIC_PANSEP% = $101
Global  BASS_ATTRIB_MUSIC_PSCALER% = $102
Global  BASS_ATTRIB_MUSIC_BPM% = $103
Global  BASS_ATTRIB_MUSIC_SPEED% = $104
Global  BASS_ATTRIB_MUSIC_VOL_GLOBAL% = $105
Global  BASS_ATTRIB_MUSIC_VOL_CHAN% = $200 ' + channel #
Global  BASS_ATTRIB_MUSIC_VOL_INST% = $300 ' + instrument #

' BASS_ChannelGetData flags
Global  BASS_DATA_AVAILABLE% = 0			' query how much data is buffered
Global  BASS_DATA_FLOAT% = $40000000	' flag: return floating-point sample data
Global  BASS_DATA_FFT256% = $80000000	' 256 sample FFT
Global  BASS_DATA_FFT512% = $80000001	' 512 FFT
Global  BASS_DATA_FFT1024% = $80000002	' 1024 FFT
Global  BASS_DATA_FFT2048% = $80000003	' 2048 FFT
Global  BASS_DATA_FFT4096% = $80000004	' 4096 FFT
Global  BASS_DATA_FFT8192% = $80000005	' 8192 FFT
Global  BASS_DATA_FFT16384% = $80000006	' 16384 FFT
Global  BASS_DATA_FFT_INDIVIDUAL% = $10	' FFT flag: FFT for each channel, else all combined
Global  BASS_DATA_FFT_NOWINDOW% = $20	' FFT flag: no Hanning window
Global  BASS_DATA_FFT_REMOVEDC% = $40	' FFT flag: pre-remove DC bias

' BASS_ChannelGetTags types : what's returned
Global  BASS_TAG_ID3% = 0	' ID3v1 tags : TAG_ID3
Global  BASS_TAG_ID3V2% = 1	' ID3v2 tags : ByteBuffer
Global  BASS_TAG_OGG% = 2	' OGG comments : String array
Global  BASS_TAG_HTTP% = 3	' HTTP headers : String array
Global  BASS_TAG_ICY% = 4	' ICY headers : String array
Global  BASS_TAG_META% = 5	' ICY metadata : String
Global  BASS_TAG_APE% = 6	' APE tags : String array
Global  BASS_TAG_MP4% = 7	' MP4/iTunes metadata : String array
Global  BASS_TAG_VENDOR% = 9	' OGG encoder : String
Global  BASS_TAG_LYRICS3% = 10	' Lyric3v2 tag : String
Global  BASS_TAG_WAVEFORMAT% = 14	' WAVE format : ByteBuffer containing WAVEFORMATEEX structure
Global  BASS_TAG_RIFF_INFO% = $100 ' RIFF "INFO" tags : String array
Global  BASS_TAG_RIFF_BEXT% = $101 ' RIFF/BWF "bext" tags : TAG_BEXT
Global  BASS_TAG_RIFF_CART% = $102 ' RIFF/BWF "cart" tags : TAG_CART
Global  BASS_TAG_RIFF_DISP% = $103 ' RIFF "DISP" text tag : String
Global  BASS_TAG_APE_BINARY% = $1000	' + index #, binary APE tag : TAG_APE_BINARY
Global  BASS_TAG_MUSIC_NAME% = $10000	' MOD music name : String
Global  BASS_TAG_MUSIC_MESSAGE% = $10001	' MOD message : String
Global  BASS_TAG_MUSIC_ORDERS% = $10002	' MOD order list : ByteBuffer
Global  BASS_TAG_MUSIC_INST% = $10100	' + instrument #, MOD instrument name : String
Global  BASS_TAG_MUSIC_SAMPLE% = $10300	' + sample #, MOD sample name : String

' BASS_ChannelGetLength/GetPosition/SetPosition modes
Global  BASS_POS_BYTE% = 0		' byte position
Global  BASS_POS_MUSIC_ORDER% = 1		' order.row position, MAKELONG(order,row)
Global  BASS_POS_DECODE% = $10000000 ' flag: get the decoding (not playing) position
Global  BASS_POS_DECODETO% = $20000000 ' flag: decode to the position instead of seeking

' DX8 effect types, use with BASS_ChannelSetFX
Global  BASS_FX_DX8_CHORUS% = 0
Global  BASS_FX_DX8_COMPRESSOR% = 1
Global  BASS_FX_DX8_DISTORTION% = 2
Global  BASS_FX_DX8_ECHO% = 3
Global  BASS_FX_DX8_FLANGER% = 4
Global  BASS_FX_DX8_GARGLE% = 5
Global  BASS_FX_DX8_I3DL2REVERB% = 6
Global  BASS_FX_DX8_PARAMEQ% = 7
Global  BASS_FX_DX8_REVERB% = 8

Global  BASS_DX8_PHASE_NEG_180% = 0
Global  BASS_DX8_PHASE_NEG_90% = 1
Global  BASS_DX8_PHASE_ZERO% = 2
Global  BASS_DX8_PHASE_90% = 3
Global  BASS_DX8_PHASE_180% = 4

Extern

Function BASS_Init?(device%, freq%, flags%)="BASS.BASS_Init"
Function BASS_GetInfo?(info:BASS_INFO)="BASS.BASS_GetInfo"
Function BASS_SetConfig?(option%, value%)="BASS.BASS_SetConfig"
Function BASS_GetConfig%(option%)="BASS.BASS_GetConfig"

Function BASS_ChannelStop?(handle%)="BASS.BASS_ChannelStop"
Function BASS_ChannelIsActive%(handle%)="BASS.BASS_ChannelIsActive"
Function BASS_ChannelSetAttribute?(handle%, attrib%, value#)="BASS.BASS_ChannelSetAttribute"
Function BASS_ChannelPlay?(handle%, restart?)="BASS.BASS_ChannelPlay"

Function BASS_SampleLoad%(file$, offset#, length%, max%, flags%)="BassGlue.BASS_SampleLoad"
Function BASS_SampleGetChannel%(handle%, onlynew?)="BASS.BASS_SampleGetChannel"
Function BASS_SampleFree%(handle%)="BASS.BASS_SampleFree"
Function BASS_SampleGetInfo?(handle%, info:BASS_SAMPLE)="BASS.BASS_SampleGetInfo"
Function BASS_SampleSetInfo?(handle%, info:BASS_SAMPLE)="BASS.BASS_SampleSetInfo"
Function BASS_SampleGetChannels%(handle%, channels%[])="BASS.BASS_SampleGetChannels"

' Device info structure
Class BASS_DEVICEINFO="BASS.BASS_DEVICEINFO"
	Field name$	' description
	Field driver$	' driver
	Field flags%
End

Class BASS_INFO="BASS.BASS_INFO"
	Field flags%	' device capabilities (DSCAPS_xxx flags)
	Field hwsize%	' size of total device hardware memory
	Field hwfree%	' size of free device hardware memory
	Field freesam%	' number of free sample slots in the hardware
	Field free3d%	' number of free 3D sample slots in the hardware
	Field minrate%	' min sample rate supported by the hardware
	Field maxrate%	' max sample rate supported by the hardware
	Field eax%		' device supports EAX? (always FALSE if BASS_DEVICE_3D was not used)
	Field minbuf%	' recommended minimum buffer length in ms (requires BASS_DEVICE_LATENCY)
	Field dsver%	' DirectSound version
	Field latency%	' delay (in ms) before start of playback (requires BASS_DEVICE_LATENCY)
	Field initflags% ' BASS_Init "flags" parameter
	Field speakers% ' number of speakers available
	Field freq%		' current output rate
End

' Recording device info structure
Class BASS_RECORDINFO="BASS.RECORDINFO"
	Field flags%	' device capabilities (DSCCAPS_xxx flags)
	Field formats%	' supported standard formats (WAVE_FORMAT_xxx flags)
	Field inputs%	' number of inputs
	Field singlein?	' TRUE = only 1 input can be set at a time
	Field freq%		' current input rate
End

' Sample info structure
Class BASS_SAMPLE="BASS.BASS_SAMPLE"
	Field freq%		' default playback rate
	Field volume#	' default volume (0-1)
	Field pan#		' default pan (-1=left, 0=middle, 1=right)
	Field flags%	' BASS_SAMPLE_xxx flags
	Field length%	' length (in bytes)
	Field max%		' maximum simultaneous playbacks
	Field origres%	' original resolution bits
	Field chans%	' number of channels
	Field mingap%	' minimum gap (ms) between creating channels
	Field mode3d%	' BASS_3DMODE_xxx mode
	Field mindist#	' minimum distance
	Field maxdist#	' maximum distance
	Field iangle%	' angle of inside projection cone
	Field oangle%	' angle of outside projection cone
	Field outvol#	' delta-volume outside the projection cone
	Field vam%		' voice allocation/management flags (BASS_VAM_xxx)
	Field priority%	' priority (0=lowest, $ffffffff=highest)
End

' Channel info structure
Class BASS_CHANNELINFO="BASS.CHANNELINFO"
	Field freq%		' default playback rate
	Field chans%	' channels
	Field flags%	' BASS_SAMPLE/STREAM/MUSIC/SPEAKER flags
	Field ctype%	' type of channel
	Field origres%	' original resolution
	Field plugin%	' plugin
	Field sample% ' sample
	Field filename$ ' filename
End



Class BASS_PLUGINFORM="BASS.PLUGINFORM"
	Field ctype%		' channel type
	Field name$	' format description
	Field exts$	' file extension filter (*.ext1*.ext2etc...)
End

Class BASS_PLUGININFO="BASS.PLUGININFO"
	Field version%					' version (same form as BASS_GetVersion)
	Field formatc%					' number of formats
End

' ID3v1 tag structure
Class TAG_ID3="BASS.TAG_ID3"
	Field id$
	Field title$
	Field artist$
	Field album$
	Field year$
	Field comment$
	Field genre%
	Field track%
End

' Binary APE tag structure
Class TAG_APE_BINARY="BASS.TAG_APE_BINARY"
	Field key$
	Field data%[]
	Field length%
End


Class BASS_DX8_CHORUS="BASS.BASS_DX8_CHORUS"
	Field fWetDryMix#
	Field fDepth#
	Field fFeedback#
	Field fFrequency#
	Field lWaveform%	' 0=triangle, 1=sine
	Field fDelay#
	Field lPhase%		' BASS_DX8_PHASE_xxx
End

Class BASS_DX8_DISTORTION="BASS.BASS_DX8_DISTORTION"
	Field fGain#
	Field fEdge#
	Field fPostEQCenterFrequency#
	Field fPostEQBandwidth#
	Field fPreLowpassCutoff#
End

Class BASS_DX8_ECHO="BASS.BASS_DX8_ECHO"
	Field fWetDryMix#
	Field fFeedback#
	Field fLeftDelay#
	Field fRightDelay#
	Field lPanDelay?
End

Class BASS_DX8_FLANGER="BASS.BASS_DX8_FLANGER"
	Field fWetDryMix#
	Field fDepth#
	Field fFeedback#
	Field fFrequency#
	Field lWaveform%	' 0=triangle, 1=sine
	Field fDelay#
	Field lPhase%		' BASS_DX8_PHASE_xxx
End

Class BASS_DX8_PARAMEQ="BASS.BASS_DX8PARAMEQ"
	Field fCenter#
	Field fBandwidth#
	Field fGain#
End

Class BASS_DX8_REVERB="BASS.BASS_DX8_REVERB"
	Field fInGain#
	Field fReverbMix#
	Field fReverbTime#
	Field fHighFreqRTRatio#
End
