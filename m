Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsiOk-0006tj-VN
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 17:11:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiOh-0006iG-Ns
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:11:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiOg-0008NT-Kn
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:11:23 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:58241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RsiOd-0008JT-AY; Wed, 01 Feb 2012 17:11:19 -0500
Received: by mail-pz0-f45.google.com with SMTP id p14so1612186dad.4
	for <multiple recipients>; Wed, 01 Feb 2012 14:11:18 -0800 (PST)
Received: by 10.68.209.6 with SMTP id mi6mr1325431pbc.87.1328134278790;
	Wed, 01 Feb 2012 14:11:18 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id o7sm1216414pbq.8.2012.02.01.14.11.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 14:11:17 -0800 (PST)
Message-ID: <4F29B882.4040209@codemonkey.ws>
Date: Wed, 01 Feb 2012 16:11:14 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <4F1DA82F.4090808@siemens.com> <4F2297FB.2040508@siemens.com>
	<4F267095.6010207@siemens.com>
In-Reply-To: <4F267095.6010207@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] optionroms: Silence
 intermediate file removal
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 22:11:25 -0000

On 01/30/2012 04:27 AM, Jan Kiszka wrote:
> The build process of optionroms spits out an "rm ..." line. Moreover, it
> removes all .o files that can be handy for debugging purposes. So
> disable automatic intermediate removal.
>
> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>
> Changes in v3:
>   - do not remove intermediate file manually, it breaks parallel build
>
>   pc-bios/optionrom/Makefile |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 51da288..2caf7e6 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -16,6 +16,9 @@ QEMU_CFLAGS = $(CFLAGS)
>
>   build-all: multiboot.bin linuxboot.bin
>
> +# suppress auto-removal of intermediate files
> +.SECONDARY:
> +
>   %.img: %.o
>   	$(call quiet-command,$(LD) -Ttext 0 -e _start -s -o $@ $<,"  Building $(TARGET_DIR)$@")
>


