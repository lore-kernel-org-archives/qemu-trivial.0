Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDZs-0006DV-1r
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:45:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDZp-0006Bt-2N
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:45:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDZk-0004Lb-VG
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:45:03 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60901)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDZh-0003nK-Az; Thu, 14 Feb 2019 04:44:59 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MsI0K-1hElYn17Vq-00toLd; Thu, 14 Feb 2019 10:44:35 +0100
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
	<20190207193605.25676-2-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <aff2dc8f-4be1-8c05-a8c7-45c704b45e1a@vivier.eu>
Date: Thu, 14 Feb 2019 10:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190207193605.25676-2-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5TxgVDKK+pNf6bNPBC0j7KETN+zemyVrSxJs+7VDF9XS5wkPfJq
	lxzv/V2qam5KYHBWCVu6F6CdbeNhiWytYfc7CF6hx2UUNLOlkIvEZGLz1IiD6kpSNb0x/k6
	6+5oCjEEYoGo/TGA3OvZmZNZo+PCchSjFmr+lZFUrPU8o09dxJrPSaxFuHcyFKW4mV2dti3
	+BkV0UdJF/dOvaxdSC6Jw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vDH62xFsv1c=:HIG9/xw2V7/BMtiR+ZXyNp
	VQCc8T7ZnkfI9VfjTMxyg8lzbOMFIP+9A50W/dCbbVFZXoL78OhXL/QuZmmp4E9k3p87v4nYc
	PJw1y1WYOg2lN1ECw9YPtnL1270b+BfTr8Q4AmpIxeXMrrdaMZEqz1XiaoFQywh4yV2oLrKdW
	I0mjY2clJsxxF5gTH7vwBFhQGdQyvxNgjF57mkejFsC9J0a6BGFureZpIL+To8jC2iS8Y2bVB
	M2lS0axxq1/o9cplT9wRy4LX44OAA9SufCT/Ua0Su5uH9orNq6ElX2uUzFAz8jHf7/FuktA7Y
	fJurUmL9Y4hLbxjsFV2522btuCnPB74VRctuFLCOKo1ED4wXtDeJk4OGlGJWvx/JKc3l+0L4t
	vJLsvB0VDvVmrH9wGEMRiMdJxBRzo1fV3I0aBlBZ8y6ond6n8P48le9WyGdkUbf49hiHizuHm
	RPtX44dgtB0XGa9C7GdoY2PZS0kU48Ff1nVYyHVLh21IPJ8baBJSI/IgxtDjDxjVmmJD9ieDo
	xFEpWwd0LbFV85o2Nx+hsjNrFviUaQl09b8gSoo3kTlwKmQTn+/u0/yQLmcO8SRBzf+oeEnaF
	0BMvxxadnQNeDEsjNopCk4XeQTuwDMVdiBLi79pp/GUnUjj7svfVlgtPFSt9eJwqy/WsSYREM
	DwY9/iOBlXyVz7hug4jTIn+UYyPgXIwsJluOL55qE5mCwLel5cvD1SkG45FJIBh4FNXuKAPo6
	4iozTuUMorhwXhGYpRYufVNCBtwbzpUOKavMWqNOEg1Wf39+K+JGrLXLPHo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH 1/4] configure: remove handling of "wav"
 audio driver
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
X-List-Received-Date: Thu, 14 Feb 2019 09:45:06 -0000

On 07/02/2019 20:36, Cleber Rosa wrote:
> This looks like a leftover that was never implemented.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  configure | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/configure b/configure
> index fbd0825488..ff55e2273e 100755
> --- a/configure
> +++ b/configure
> @@ -3350,10 +3350,6 @@ for drv in $audio_drv_list; do
>        oss_libs="$oss_lib"
>      ;;
>  
> -    wav)
> -    # XXX: Probes for CoreAudio, DirectSound
> -    ;;
> -
>      *)
>      echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
>          error_exit "Unknown driver '$drv' selected" \
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

