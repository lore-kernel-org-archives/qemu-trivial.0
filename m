Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1akqNB-0003tI-A1
	for mharc-qemu-trivial@gnu.org; Tue, 29 Mar 2016 05:55:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1akqN5-0003pD-KE
	for qemu-trivial@nongnu.org; Tue, 29 Mar 2016 05:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1akqN4-0007Fz-Kl
	for qemu-trivial@nongnu.org; Tue, 29 Mar 2016 05:55:35 -0400
Received: from [59.151.112.132] (port=11879 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1akqMt-0007Bw-Ll; Tue, 29 Mar 2016 05:55:25 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5057864"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Mar 2016 17:55:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F2C5408D270;
	Tue, 29 Mar 2016 17:55:16 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 29 Mar 2016 17:55:15 +0800
To: <qemu-devel@nongnu.org>
References: <1459244924-9840-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56FA5192.6060506@cn.fujitsu.com>
Date: Tue, 29 Mar 2016 17:57:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1459244924-9840-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 7F2C5408D270.A61E3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, imammedo@redhat.com, mjt@tls.msk.ru,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] smbios: fix typo
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
X-List-Received-Date: Tue, 29 Mar 2016 09:55:39 -0000

sorry mjt, I intended to cc qemu-trivial, now I made it:)

On 03/29/2016 05:48 PM, Cao jin wrote:
> The spec says: "on paragraph (16-byte) boundaries"
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   include/hw/smbios/smbios.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/smbios/smbios.h b/include/hw/smbios/smbios.h
> index 76ccf70..ba36746 100644
> --- a/include/hw/smbios/smbios.h
> +++ b/include/hw/smbios/smbios.h
> @@ -33,7 +33,7 @@ typedef enum SmbiosEntryPointType {
>
>   /* SMBIOS Entry Point
>    * There are two types of entry points defined in the SMBIOS specification
> - * (see below). BIOS must place the entry point(s) at a 16-bit-aligned
> + * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
>    * address between 0xf0000 and 0xfffff. Note that either entry point type
>    * can be used in a 64-bit target system, except that SMBIOS 2.1 entry point
>    * only allows the SMBIOS struct table to reside below 4GB address space.
>

-- 
Yours Sincerely,

Cao jin



