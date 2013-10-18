Strict

Import mojo
Import bass

Class MyBassTestApp Extends App
	Field sample%
	Field startStop? = False

	Method OnEnter%()
		BASS_Init(-1, 44100, BASS_DEVICE_LATENCY)

		Local info:BASS_INFO = new BASS_INFO()
		BASS_GetInfo(info)
		Print "BUFFER: " + info.minbuf

		BASS_SetConfig(BASS_CONFIG_UPDATEPERIOD, 5)
		BASS_SetConfig(BASS_CONFIG_BUFFER, 5 + info.minbuf)

		Print(BASS_GetConfig(BASS_CONFIG_BUFFER))

		sample = BASS_SampleLoad("sfx/Jump 140bpm/6.ogg", 0, 0, 1, BASS_SAMPLE_LOOP)
	End

	Method OnLeave%()
	End

	Method OnUpdate%()
		If TouchHit()
			startStop = Not startStop
			If (startStop)
				BASS_ChannelPlay(BASS_SampleGetChannel(sample, false), true);
			Else
				BASS_ChannelStop(sample);
			End
		End
	End

	Method OnRender%()
	End
End

Function Main:Int()
	Local app := New MyBassTestApp()   
    Return 0
End