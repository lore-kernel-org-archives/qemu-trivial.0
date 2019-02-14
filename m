Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDsB-0002Sd-04
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:04:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDs4-0002Ny-HS
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:03:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDs3-0006bs-Fd
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:03:56 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:44291)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDs1-0006Ut-Ce; Thu, 14 Feb 2019 05:03:55 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mo7if-1hRZjY2coN-00pdJ1; Thu, 14 Feb 2019 11:03:35 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-trivial@nongnu.org,
	philmd@redhat.com, Artyom Tarasenko <atar4qemu@gmail.com>
References: <1550041639-10232-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bbc17545-9038-6a21-e322-765ef5790053@vivier.eu>
Date: Thu, 14 Feb 2019 11:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1550041639-10232-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:S5z2hD9w2t6mgXXxYplc6hU22jMgY9NUD8/9yiF5IA4jVCPFehn
	wS69LgRgaM/T8xjijvdVHH+y8zxjugscMJhQvIX0AqlG/K8TMexZ8gBntPB9r5q4nZSnfTr
	eNWgWhbbVEpJAdPC2lW0QjUC4qOJ4/UvQXFJKjqhD7UJln3558tdmR0zUSeYSFxbZ3HQnVq
	l71pgNT38EZnF8xDbIQpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D2KK8IKpRmA=:std6CRYf0VFGyNeAhuHx6l
	x1CjCMZFJYRusKIeGPrJuswk12Kxrm32F0cPL6V0IyL1pzFuHNdJLlgECbUVccC5nC6GKCKYO
	xPyzd17YFguC5qv9xdaPd50wkfiJCO/83BLQkFHH1pBLq53NfbD265f4BcbBZnNhYVErIzRVE
	ei4x2qxech0b5+9rgk7ds8tn1yuSx0sxvxFITKS43WAu1hsxwgm79oZtd6dOvRFxInIPAtTLT
	cSlkYyjMN+hG1QAsd8B81w3oX74xYVsGchyWOqxAxi0FGIVxDUHhyXyTgOZBC5aZqBoJnPlJN
	RATlbWF5NzBGRrCKdmtU8SrebELnd0BLowJIv0AsZmJtGMYuzQWJbxThLr69YnmaEIHrdfZmr
	YiyuWVCRZU52OiUdXeDK7lvYlEdA4E8DkUAzykORYMJLcV0EVxdfEikg5m+Wn6NE33OQEbJiz
	bEC6Y67TZkOmnlRLuRiOt3O5rtpk2aATt+1mo3i2muGgHRAWkrdtjlzpnZO0ArwveftaGHQqW
	Xh56xh7w6MBz6XWfopXu1DiHANG7yKsN2WO69OQV4HLTtSEFlLoUWAY0TyQihofCE+cdvuRvD
	V08lU2Ay7agNDl5rjOPCWaAWe+4npF7WRuYpTRIY0sJwvhifB1HQtgL2DdU5zDsPJCh3we/ZK
	45/aJIc/6dGgaYpb71Ivs/j4TyI3eg2ds7Wr6SRbD0YyQHXi7+yO8nRORgQwkDGJiLGO56jsG
	7vsBH74e+EOgZtDzJ4uzU+rxS3U3Swec/2yKJXRqIvNJW5MhTgX5Mgoz2aM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH] hw/sparc64: Explicitly set
 default_display = "std"
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
X-List-Received-Date: Thu, 14 Feb 2019 10:03:58 -0000

On 13/02/2019 08:07, Thomas Huth wrote:
> The sun4uv_init() function expects vga_interface_type to be either
> VGA_STD or VGA_NONE and sets up a stdvga device or no vga card
> accordingly.
> However, the code in vl.c prefers the Cirrus VGA card to stdvga if
> it is available and the user and the machine did not specify anything
> else.
> So far this has not been a problem, since the Cirrus VGA was not linked
> into the sparc64 target. But with the upcoming Kconfig build system,
> all theoretically possible PCI cards will be enabled by default, so the
> Cirrus VGA card might become available on the sparc64 target, too. vl.c
> then picks the wrong card, causing sun4uv_init() to abort.
> Thus let's make it explicit that we always want stdvga for sparc64 and
> so set default_display = "std" for these machines.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/sparc64/sun4u.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index ff24d9b..399f2d7 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -797,6 +797,7 @@ static void sun4u_class_init(ObjectClass *oc, void *data)
>      mc->default_boot_order = "c";
>      mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
>      mc->ignore_boot_device_suffixes = true;
> +    mc->default_display = "std";
>      fwc->get_dev_path = sun4u_fw_dev_path;
>  }
>  
> @@ -820,6 +821,7 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = 1; /* XXX for now */
>      mc->default_boot_order = "c";
>      mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
> +    mc->default_display = "std";
>  }
>  
>  static const TypeInfo sun4v_type = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

