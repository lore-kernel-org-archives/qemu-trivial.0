Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtKNr-0008Ec-VN
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2019 17:49:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtKNo-0008Du-Ft
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2019 17:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtKNn-0000X5-5G
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2019 17:49:00 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtKNm-0000Rv-S0
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2019 17:48:58 -0500
Received: by mail-wm1-f67.google.com with SMTP id j125so976185wmj.1
	for <qemu-trivial@nongnu.org>; Mon, 11 Feb 2019 14:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GvcD3KwBhle/+8AlGTgIW/a9F+4tl5aWPAwGvzfoX18=;
	b=WMCi+FtkQLttlZwSxBU6qCnKHnq+GKA6VUaj12b96GxqTDuyLWa1gbD2lFgKj86f+E
	CEkpGVKGFfZ8K2+mUSSZfMGLnQiPcRvItsh5NdcRgdfnkbwgGjxjpf98WEqinEdoe238
	EGr0QXkpdSEFCEzrmXXJ3T7ACIfKJErVzPHn6qCtapRfih+ykJf8HoabDjFS9TFLVXej
	MKR7ttHyaViIZCgBkHKVMBES8cnWi9KyrPrsC0t2JKOz9/zswlcsbaNp18lWrlBDHwno
	uM3gnZzfhna9FnjS2B9H1E5ru3hDEXr6o+Q2BkYYDIK6zraBPTUE/4Xvk1eacV0kvX5+
	fNsg==
X-Gm-Message-State: AHQUAub6rFE7WxeFRQ3gjJstSphnnwg0v4/7pHKAcx/LOX39e3cme1lC
	dnSPXXg/5DCNjoNRlaftiBEVjQ==
X-Google-Smtp-Source: AHgI3IaPAWfFo36lXlZPL1xFn4YIlPdUvkRa6fB9w6vGF1b162q8GCj6ncou37DKSeHoITw0gUCLhg==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr434830wmj.100.1549925330238; 
	Mon, 11 Feb 2019 14:48:50 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	c65sm1045960wma.24.2019.02.11.14.48.49
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 14:48:49 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?=
	<dirty.ice.hu@gmail.com>
References: <1549336101-17623-1-git-send-email-thuth@redhat.com>
	<1549336101-17623-2-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cc4f3b8e-44f6-d157-362d-976bfbbd5a44@redhat.com>
Date: Mon, 11 Feb 2019 23:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549336101-17623-2-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] audio/sdlaudio: Remove
 the semaphore code
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
X-List-Received-Date: Mon, 11 Feb 2019 22:49:02 -0000

On 2/5/19 4:08 AM, Thomas Huth wrote:
> The semaphore code was only working with SDL1.2 - with SDL2, it causes
> a deadlock. Since we've removed support for SDL1.2 recently, we can
> now completely remove the semaphore code from sdlaudio.c.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  audio/sdlaudio.c | 145 ++-----------------------------------------------------
>  1 file changed, 5 insertions(+), 140 deletions(-)
> 
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index 9db5ac9..53bfdbf 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -38,14 +38,9 @@
>  #define AUDIO_CAP "sdl"
>  #include "audio_int.h"
>  
> -#define USE_SEMAPHORE (SDL_MAJOR_VERSION < 2)
> -
>  typedef struct SDLVoiceOut {
>      HWVoiceOut hw;
>      int live;
> -#if USE_SEMAPHORE
> -    int rpos;
> -#endif
>      int decr;
>  } SDLVoiceOut;
>  
> @@ -57,10 +52,6 @@ static struct {
>  
>  static struct SDLAudioState {
>      int exit;
> -#if USE_SEMAPHORE
> -    SDL_mutex *mutex;
> -    SDL_sem *sem;
> -#endif
>      int initialized;
>      bool driver_created;
>  } glob_sdl;
> @@ -77,66 +68,6 @@ static void GCC_FMT_ATTR (1, 2) sdl_logerr (const char *fmt, ...)
>      AUD_log (AUDIO_CAP, "Reason: %s\n", SDL_GetError ());
>  }
>  
> -static int sdl_lock (SDLAudioState *s, const char *forfn)
> -{
> -#if USE_SEMAPHORE
> -    if (SDL_LockMutex (s->mutex)) {
> -        sdl_logerr ("SDL_LockMutex for %s failed\n", forfn);
> -        return -1;
> -    }
> -#else
> -    SDL_LockAudio();
> -#endif
> -
> -    return 0;
> -}
> -
> -static int sdl_unlock (SDLAudioState *s, const char *forfn)
> -{
> -#if USE_SEMAPHORE
> -    if (SDL_UnlockMutex (s->mutex)) {
> -        sdl_logerr ("SDL_UnlockMutex for %s failed\n", forfn);
> -        return -1;
> -    }
> -#else
> -    SDL_UnlockAudio();
> -#endif
> -
> -    return 0;
> -}
> -
> -static int sdl_post (SDLAudioState *s, const char *forfn)
> -{
> -#if USE_SEMAPHORE
> -    if (SDL_SemPost (s->sem)) {
> -        sdl_logerr ("SDL_SemPost for %s failed\n", forfn);
> -        return -1;
> -    }
> -#endif
> -
> -    return 0;
> -}
> -
> -#if USE_SEMAPHORE
> -static int sdl_wait (SDLAudioState *s, const char *forfn)
> -{
> -    if (SDL_SemWait (s->sem)) {
> -        sdl_logerr ("SDL_SemWait for %s failed\n", forfn);
> -        return -1;
> -    }
> -    return 0;
> -}
> -#endif
> -
> -static int sdl_unlock_and_post (SDLAudioState *s, const char *forfn)
> -{
> -    if (sdl_unlock (s, forfn)) {
> -        return -1;
> -    }
> -
> -    return sdl_post (s, forfn);
> -}
> -
>  static int aud_to_sdlfmt (audfmt_e fmt)
>  {
>      switch (fmt) {
> @@ -243,9 +174,9 @@ static int sdl_open (SDL_AudioSpec *req, SDL_AudioSpec *obt)
>  static void sdl_close (SDLAudioState *s)
>  {
>      if (s->initialized) {
> -        sdl_lock (s, "sdl_close");
> +        SDL_LockAudio();
>          s->exit = 1;
> -        sdl_unlock_and_post (s, "sdl_close");
> +        SDL_UnlockAudio();
>          SDL_PauseAudio (1);
>          SDL_CloseAudio ();
>          s->initialized = 0;
> @@ -267,30 +198,10 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
>          int to_mix, decr;
>  
>          /* dolog ("in callback samples=%d\n", samples); */
> -#if USE_SEMAPHORE
> -        sdl_wait (s, "sdl_callback");
> -        if (s->exit) {
> -            return;
> -        }
> -
> -        if (sdl_lock (s, "sdl_callback")) {
> -            return;
> -        }
> -
> -        if (audio_bug(__func__, sdl->live < 0 || sdl->live > hw->samples)) {
> -            dolog ("sdl->live=%d hw->samples=%d\n",
> -                   sdl->live, hw->samples);
> -            return;
> -        }
>  
> -        if (!sdl->live) {
> -            goto again;
> -        }
> -#else
>          if (s->exit || !sdl->live) {
>              break;
>          }
> -#endif
>  
>          /* dolog ("in callback live=%d\n", live); */
>          to_mix = audio_MIN (samples, sdl->live);
> @@ -301,33 +212,20 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
>  
>              /* dolog ("in callback to_mix %d, chunk %d\n", to_mix, chunk); */
>              hw->clip (buf, src, chunk);
> -#if USE_SEMAPHORE
> -            sdl->rpos = (sdl->rpos + chunk) % hw->samples;
> -#else
>              hw->rpos = (hw->rpos + chunk) % hw->samples;
> -#endif
>              to_mix -= chunk;
>              buf += chunk << hw->info.shift;
>          }
>          samples -= decr;
>          sdl->live -= decr;
>          sdl->decr += decr;
> -
> -#if USE_SEMAPHORE
> -    again:
> -        if (sdl_unlock (s, "sdl_callback")) {
> -            return;
> -        }
> -#endif
>      }
>      /* dolog ("done len=%d\n", len); */
>  
> -#if (SDL_MAJOR_VERSION >= 2)
>      /* SDL2 does not clear the remaining buffer for us, so do it on our own */
>      if (samples) {
>          memset(buf, 0, samples << hw->info.shift);
>      }
> -#endif
>  }
>  
>  static int sdl_write_out (SWVoiceOut *sw, void *buf, int len)
> @@ -339,11 +237,8 @@ static int sdl_run_out (HWVoiceOut *hw, int live)
>  {
>      int decr;
>      SDLVoiceOut *sdl = (SDLVoiceOut *) hw;
> -    SDLAudioState *s = &glob_sdl;
>  
> -    if (sdl_lock (s, "sdl_run_out")) {
> -        return 0;
> -    }
> +    SDL_LockAudio();
>  
>      if (sdl->decr > live) {
>          ldebug ("sdl->decr %d live %d sdl->live %d\n",
> @@ -355,19 +250,10 @@ static int sdl_run_out (HWVoiceOut *hw, int live)
>      decr = audio_MIN (sdl->decr, live);
>      sdl->decr -= decr;
>  
> -#if USE_SEMAPHORE
> -    sdl->live = live - decr;
> -    hw->rpos = sdl->rpos;
> -#else
>      sdl->live = live;
> -#endif
>  
> -    if (sdl->live > 0) {
> -        sdl_unlock_and_post (s, "sdl_run_out");
> -    }
> -    else {
> -        sdl_unlock (s, "sdl_run_out");
> -    }
> +    SDL_UnlockAudio();
> +
>      return decr;
>  }
>  
> @@ -449,23 +335,6 @@ static void *sdl_audio_init (void)
>          return NULL;
>      }
>  
> -#if USE_SEMAPHORE
> -    s->mutex = SDL_CreateMutex ();
> -    if (!s->mutex) {
> -        sdl_logerr ("Failed to create SDL mutex\n");
> -        SDL_QuitSubSystem (SDL_INIT_AUDIO);
> -        return NULL;
> -    }
> -
> -    s->sem = SDL_CreateSemaphore (0);
> -    if (!s->sem) {
> -        sdl_logerr ("Failed to create SDL semaphore\n");
> -        SDL_DestroyMutex (s->mutex);
> -        SDL_QuitSubSystem (SDL_INIT_AUDIO);
> -        return NULL;
> -    }
> -#endif
> -
>      s->driver_created = true;
>      return s;
>  }
> @@ -474,10 +343,6 @@ static void sdl_audio_fini (void *opaque)
>  {
>      SDLAudioState *s = opaque;
>      sdl_close (s);
> -#if USE_SEMAPHORE
> -    SDL_DestroySemaphore (s->sem);
> -    SDL_DestroyMutex (s->mutex);
> -#endif
>      SDL_QuitSubSystem (SDL_INIT_AUDIO);
>      s->driver_created = false;
>  }
> 

