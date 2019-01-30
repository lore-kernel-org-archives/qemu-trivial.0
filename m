Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomAR-00071R-Ho
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomAL-0006uv-MX
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomAH-0004jc-TV
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:28:17 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53985)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gom9t-0004RU-Dh; Wed, 30 Jan 2019 04:27:49 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N17l4-1hHwrU21f8-012VLt; Wed, 30 Jan 2019 10:27:42 +0100
To: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
Cc: thuth@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org
References: <20190124162045.10474-1-sourav.jb1988@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <bec07d22-d33f-ed5b-8b96-deb431f2d189@vivier.eu>
Date: Wed, 30 Jan 2019 10:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190124162045.10474-1-sourav.jb1988@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:aBzlQzTtpq0qmZcYGQzo971GuxX203VR7X9tRnBYz+XwZjhGzb8
	idPGK76VnDQs9Af5o23eIO6dinsS4bXdidjMGsMvWljvr8gssQKxR9zRvetQNLw3HB895rB
	zgPdyag/SOq6QlICCNllV14lWPh9iZTzEaowJk6PZfwIYr3gsHCMPo1nb/pKSi9FHSrmJpZ
	niGGG9tpPmzOZ/MfZ7tYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6QELaIDRtcA=:u7oGdFCrXwM/J1snx1yJTp
	7DoLCwL3I3hTUZ++IMAHLXfyteKD5Yt5fB+d+PD7sAKqi20zqzQWvZN22pQlesnjmxeCyk0aW
	gHCdsHIw5rn7dFE0oBpb+UrXKsrH7jRKVDetB2fe+pnFmbzutxjRhg5WO/ldrBUsE+rqYBesd
	sjIhI/rZJvd+0rEJOYWv1F++5Z7IhJBOg/+M3ZEH8WymNcRF+ZZ+SFzB4Y3wrKVJizXGJYe+G
	O3o436uudZ07On4VgAixpvLHi7p/OcpgJ/AHHOaJw8IFEZMF0rBENRWLQEDF/ePOxqjjrKVnl
	NcSuASOGqCfcF2kH1xTKRpBYnaBLV1RR4BNx58AHhCZVdOZdt7Gi6T8ZTS/2O9kDb1Xf3sRgL
	hm8gliSgDDXyLwwMEyntfrYrOtzE78AUkNtr87veT4SRMdF4j3ZISqAffSN0hu36QqDrAU4T1
	evoPNtjLGZB/GVPGGecZUB2CLqTxmQiScbfs8QqUeMOwj2/KUwT+WYGCkn/gGvl4K9WAj3XWU
	cMCiwLoDd73d8k3Kl5BxygBqhl5P/24QtxybAKG3jg4d+m4ATOgTQ/W/LP6CD6eGBNlMfTMyP
	32nP3pAmnSBIUsf+BDFe3Wdse4GoVCdECrs91nJTP9Sm9JT1UrCjSM0zjqxTd2C4qxxuEl7Ln
	obKLzP+XxIwoax8NCWrhoaOgPikphE7A6N6iglTTcFwrAE9qa226O2W3uIru8b19iT8r5g3Up
	USzU/vLnuj61TgrwAc6DW1ufOdO41CCar3+4zblgZqWWqyCic8dxaY4DpQk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH] hw: sd: set category of the sd memory
 card
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
X-List-Received-Date: Wed, 30 Jan 2019 09:28:23 -0000

On 24/01/2019 17:20, kumar sourav wrote:
> Sets the category of the sd memory card as DEVICE_CATEGORY_STORAGE.
> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> ---
>  hw/sd/sd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index d4356e9b73..aaab15f386 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2121,6 +2121,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &sd_vmstate;
>      dc->reset = sd_reset;
>      dc->bus_type = TYPE_SD_BUS;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  
>      sc->set_voltage = sd_set_voltage;
>      sc->get_dat_lines = sd_get_dat_lines;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

