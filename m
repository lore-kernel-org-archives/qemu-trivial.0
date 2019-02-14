Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDnV-0008Eq-Fy
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:59:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDnT-0008Ch-3z
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:59:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDnS-0003bU-3a
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:59:11 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47479)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDnK-0003Yg-Uu; Thu, 14 Feb 2019 04:59:03 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M42Ss-1guDnG2q9I-0008Ge; Thu, 14 Feb 2019 10:58:58 +0100
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-5-dgilbert@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2e752418-8df4-d434-fa82-b997eecfb931@vivier.eu>
Date: Thu, 14 Feb 2019 10:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212134758.10514-5-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ULK3OI+XCnpLkNRBhxsP6rlFXNxfJDg0mkAGEgzG8QrvsuG9MOU
	IkjZugu/8gZWQfw1sJt+/m7QCUROQrzJ2Qq61kIW7JSlbJeaolLHtbzFZXpBZNzM6At3gC+
	/xSfvlNVRlctoSOXfoYj91cpXxkuifnsUeZlrOlvkoI5ywc+1C8usIVZ5wxSQMcU4x3bzSV
	AyGniIFa639rRAEd3OLWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ewKYW+eD+K4=:zZlWdQdnN8/g5u/kD/AMsR
	2UkfLeqLJvi9ZvfjpzXmZzkgWSQLt/rOr8GmfktuCwunWv/CWX7oJpx/ahkGpPcdA4A1ZAkRg
	fvwLzm1lkofJI4U2TB8izJ34e2RSojIAHrYOVCrigNbFV7TQfgxGruetS25sMnifwTwu8pRvA
	SxjouP89rn6Oqjhsy0SIsTW1YAPGwjiXSR1BGzwT5Kd7Oi6VEE1blAoCMiFBzQc27LBV+kh0V
	6hyzIWe29sh3uo86Lv/d/B+i0/3azhRHOf1Kr9684Wm5RtkwWK2YixZ21RTievM/EtZue2sA4
	tUT4+DB46uoIoE2f2fG+ahvRGZib80yU3NyRFIWNmFiikXoEWAvkrbo5YuL83Z02ZWJDy87rM
	WG5F0Yp72fH/mN+/QCy4vyfgCivCPDpyS8m76QNbV6hosMbuOQfIB2sjKD815hmOZGks9cLTd
	COzW1ua9XtEp2qResYfSmBo27k98pB1STxtoAwnALzzySheWca6QkIjLjO39+db+nHSueJHqD
	3QOkzc6W622TUD59kovsxGhnyiiXGP95zkF8Z/NMBJhkuxQzHK6zE1x4E2WfRWTy2902tkmA7
	ftkxtEjrv+B6387P5HeU0pNTUfKT7IjrAmVg7Mtkdhoja4VrI7XtAzy2OaDAYkazazD7iXY4O
	DqZOc7RfxcNYnkWJTVeNjfdRrK3RNn1JIm1Pu+7uHIM3FZMNPe3u1TGZ33fACAkiEbZQe3Fyd
	SbIvEj5kVyUGCr6cEtOPkrBiwIsglHDrfOaCqVRPsYWyHl7UVk0Vnp0KjVM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH 4/4] wavcapture: Convert to error_report
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 09:59:12 -0000

On 12/02/2019 14:47, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Kill off a pile of monitor_printf's and cur_mon usage.
> The only one left in wavcapture.c is the info case.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  audio/wavcapture.c | 39 +++++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/audio/wavcapture.c b/audio/wavcapture.c
> index cf31ed652c..cd24570aa7 100644
> --- a/audio/wavcapture.c
> +++ b/audio/wavcapture.c
> @@ -38,30 +38,29 @@ static void wav_destroy (void *opaque)
>      uint8_t dlen[4];
>      uint32_t datalen = wav->bytes;
>      uint32_t rifflen = datalen + 36;
> -    Monitor *mon = cur_mon;
>  
>      if (wav->f) {
>          le_store (rlen, rifflen, 4);
>          le_store (dlen, datalen, 4);
>  
>          if (fseek (wav->f, 4, SEEK_SET)) {
> -            monitor_printf (mon, "wav_destroy: rlen fseek failed\nReason: %s\n",
> -                            strerror (errno));
> +            error_report("wav_destroy: rlen fseek failed: %s",
> +                         strerror(errno));
>              goto doclose;
>          }
>          if (fwrite (rlen, 4, 1, wav->f) != 1) {
> -            monitor_printf (mon, "wav_destroy: rlen fwrite failed\nReason %s\n",
> -                            strerror (errno));
> +            error_report("wav_destroy: rlen fwrite failed: %s",
> +                         strerror(errno));
>              goto doclose;
>          }
>          if (fseek (wav->f, 32, SEEK_CUR)) {
> -            monitor_printf (mon, "wav_destroy: dlen fseek failed\nReason %s\n",
> -                            strerror (errno));
> +            error_report("wav_destroy: dlen fseek failed: %s",
> +                         strerror(errno));
>              goto doclose;
>          }
>          if (fwrite (dlen, 1, 4, wav->f) != 4) {
> -            monitor_printf (mon, "wav_destroy: dlen fwrite failed\nReason %s\n",
> -                            strerror (errno));
> +            error_report("wav_destroy: dlen fwrite failed: %s",
> +                         strerror(errno));
>              goto doclose;
>          }
>      doclose:
> @@ -78,8 +77,7 @@ static void wav_capture (void *opaque, void *buf, int size)
>      WAVState *wav = opaque;
>  
>      if (fwrite (buf, size, 1, wav->f) != 1) {
> -        monitor_printf (cur_mon, "wav_capture: fwrite error\nReason: %s",
> -                        strerror (errno));
> +        error_report("wav_capture: fwrite error: %s", strerror(errno));
>      }
>      wav->bytes += size;
>  }
> @@ -110,7 +108,6 @@ static struct capture_ops wav_capture_ops = {
>  int wav_start_capture (CaptureState *s, const char *path, int freq,
>                         int bits, int nchannels)
>  {
> -    Monitor *mon = cur_mon;
>      WAVState *wav;
>      uint8_t hdr[] = {
>          0x52, 0x49, 0x46, 0x46, 0x00, 0x00, 0x00, 0x00, 0x57, 0x41, 0x56,
> @@ -124,13 +121,13 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
>      CaptureVoiceOut *cap;
>  
>      if (bits != 8 && bits != 16) {
> -        monitor_printf (mon, "incorrect bit count %d, must be 8 or 16\n", bits);
> +        error_report("incorrect bit count %d, must be 8 or 16", bits);
>          return -1;
>      }
>  
>      if (nchannels != 1 && nchannels != 2) {
> -        monitor_printf (mon, "incorrect channel count %d, must be 1 or 2\n",
> -                        nchannels);
> +        error_report("incorrect channel count %d, must be 1 or 2",
> +                     nchannels);
>          return -1;
>      }
>  
> @@ -158,8 +155,8 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
>  
>      wav->f = fopen (path, "wb");
>      if (!wav->f) {
> -        monitor_printf (mon, "Failed to open wave file `%s'\nReason: %s\n",
> -                        path, strerror (errno));
> +        error_report("Failed to open wave file `%s': %s",
> +                     path, strerror(errno));
>          g_free (wav);
>          return -1;
>      }
> @@ -170,14 +167,13 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
>      wav->freq = freq;
>  
>      if (fwrite (hdr, sizeof (hdr), 1, wav->f) != 1) {
> -        monitor_printf (mon, "Failed to write header\nReason: %s\n",
> -                        strerror (errno));
> +        error_report("Failed to write header: %s", strerror(errno));
>          goto error_free;
>      }
>  
>      cap = AUD_add_capture (&as, &ops, wav);
>      if (!cap) {
> -        monitor_printf (mon, "Failed to add audio capture\n");
> +        error_report("Failed to add audio capture");
>          goto error_free;
>      }
>  
> @@ -189,8 +185,7 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
>  error_free:
>      g_free (wav->path);
>      if (fclose (wav->f)) {
> -        monitor_printf (mon, "Failed to close wave file\nReason: %s\n",
> -                        strerror (errno));
> +        error_report("Failed to close wave file: %s", strerror(errno));
>      }
>      g_free (wav);
>      return -1;
> 

Applied the one from 2017-03
(20170320173840.3626-3-dgilbert@redhat.com), as it as Gerd's R-b and it
is identical, to my trivial-patches branch.

Thanks,
Laurent

