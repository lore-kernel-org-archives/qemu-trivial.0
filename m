Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlKGa-00074m-Vd
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 11:14:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XlKGT-0006pP-4t
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 11:14:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XlKGN-0005ws-NW
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 11:13:57 -0500
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233]:43308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XlKGN-0005we-Dg; Mon, 03 Nov 2014 11:13:51 -0500
Received: by mail-lb0-f179.google.com with SMTP id l4so2866991lbv.10
	for <multiple recipients>; Mon, 03 Nov 2014 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0RqNe8lVXnCdo7YovriHDk4lQbpBC62dV1xthZZNH5E=;
	b=CzqbNaTsVmCCH4up7GgChmEK8FacPgvp4ZwL3PInmbEvVYbUmUFiu6wKxhZBQ45zao
	svS4yUZnRmWBxtFunLgkBd7kNr4sdnxArSF3DTG5nweFmXDlpAj8ZrU3rp4K0UDIabJ0
	ml/3txzPvCQ2Yu5wWSwMUNHTFHi11/on0UgKWS8LR+PBL8iI8MJeFdnfBeCMHqE+40Rx
	+NHGT4bbOl2d2Fb6yFqCUQ6cPlrid+wEGLN9e0HebqyJl4Mae1Q7zxxKRAci0ukXU914
	+xaTxFw7h2SxnHPyqP4g48jF8xERRi7zak0FcD+MCYhxzqzQbDl8Y7ucymYMEyl4E0Eh
	eHBw==
X-Received: by 10.112.162.105 with SMTP id xz9mr51427333lbb.49.1415031229341; 
	Mon, 03 Nov 2014 08:13:49 -0800 (PST)
Received: from [192.168.10.150] (net-37-117-142-149.cust.vodafonedsl.it.
	[37.117.142.149])
	by mx.google.com with ESMTPSA id d9sm8097933lbp.49.2014.11.03.08.13.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Nov 2014 08:13:47 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5457A9B7.7030908@redhat.com>
Date: Mon, 03 Nov 2014 17:13:43 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: SeokYeon Hwang <syeon.hwang@samsung.com>, qemu-devel@nongnu.org
References: <1414742525-18639-1-git-send-email-syeon.hwang@samsung.com>
In-Reply-To: <1414742525-18639-1-git-send-email-syeon.hwang@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::233
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de
Subject: Re: [Qemu-trivial] [PATCH] vdi: wrapped uuid_unparse() in #ifdef
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
X-List-Received-Date: Mon, 03 Nov 2014 16:14:03 -0000



On 31/10/2014 09:02, SeokYeon Hwang wrote:
> Wrapped uuid_unparse() in #ifdef to avoid "-Wunused-function" on clang 3.4 or later.
> 
> Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
> ---
>  block/vdi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/block/vdi.c b/block/vdi.c
> index 19701ee..e1d211c 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -137,12 +137,14 @@ static inline int uuid_is_null(const uuid_t uu)
>      return memcmp(uu, null_uuid, sizeof(uuid_t)) == 0;
>  }
>  
> +# if defined(CONFIG_VDI_DEBUG)
>  static inline void uuid_unparse(const uuid_t uu, char *out)
>  {
>      snprintf(out, 37, UUID_FMT,
>              uu[0], uu[1], uu[2], uu[3], uu[4], uu[5], uu[6], uu[7],
>              uu[8], uu[9], uu[10], uu[11], uu[12], uu[13], uu[14], uu[15]);
>  }
> +# endif
>  #endif
>  
>  typedef struct {
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

