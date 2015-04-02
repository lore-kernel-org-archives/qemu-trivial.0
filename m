Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yde2r-0007dQ-1A
	for mharc-qemu-trivial@gnu.org; Thu, 02 Apr 2015 08:16:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yde2k-0007cO-Qe
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 08:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yde2g-0006sb-JQ
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 08:16:18 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:37354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Yde2g-0006sM-CV; Thu, 02 Apr 2015 08:16:14 -0400
Received: by wiaa2 with SMTP id a2so102877187wia.0;
	Thu, 02 Apr 2015 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=OopJG/tuz6jJ5bJIA7EvL/4QlwE3C5k2dvbV6KsULiY=;
	b=JFKf2lAiRHcvhg2GsRsdqx/A5Kgh4ZxPCXhaJd3gHnz8dnhX/6SUamSwaOYkdDIxpV
	Bd/BzbokxHF2SwgOzAu0X4F5XyhK0EFvzR+G8sXcvkvmBHpDHe3iDF8NtRV3+magxNLM
	0+d/sEnczmGXkuC4+n8fNp2Xg9vqIrvV1leQfQf/yo4v+Y3tsK8o+KKxV/6DDhivZqVb
	xtZY2uQgwnOUVg3PGkivDsr/iadQKkQ7An8E3LzlSaZaUKtq89MQn/sJuCJb7fYoHbHx
	G9adp73iR8/1M3bDHwoqowEuvf6oQcN6iySIUD5c2dKF/61Pd3D0QF5V2NW8hmkIvZLJ
	E6zg==
X-Received: by 10.180.84.3 with SMTP id u3mr24224381wiy.38.1427976973124;
	Thu, 02 Apr 2015 05:16:13 -0700 (PDT)
Received: from [192.168.10.165] (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41])
	by mx.google.com with ESMTPSA id jt8sm29778316wid.4.2015.04.02.05.16.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Apr 2015 05:16:12 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <551D330A.4080108@redhat.com>
Date: Thu, 02 Apr 2015 14:16:10 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Joseph Hindin <jhindin@daynix.com>, qemu-devel@nongnu.org
References: <1427906337-20805-1-git-send-email-jhindin@daynix.com>
	<1427906337-20805-2-git-send-email-jhindin@daynix.com>
In-Reply-To: <1427906337-20805-2-git-send-email-jhindin@daynix.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] qga: fitering out
	-fstack-protector-strong
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
X-List-Received-Date: Thu, 02 Apr 2015 12:16:23 -0000



On 01/04/2015 18:38, Joseph Hindin wrote:
> configure script may add -fstack-protector-strong option instead
> of -fstack-protector-all, depending on availability ( see
> commit 63678e17c ). Both options have to by filtered out for
> qga-vss.dll, otherwise MinGW cross-compilation fails at linking
> stage.
> 
> Signed-off-by: Joseph Hindin <jhindin@daynix.com>

Thanks, applied.  For 2.4 it would be interesting to see if we can
actually enable the stack protector.

Paolo

> ---
>  qga/vss-win32/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/vss-win32/Makefile.objs b/qga/vss-win32/Makefile.objs
> index 6a69d50..7c96c6b 100644
> --- a/qga/vss-win32/Makefile.objs
> +++ b/qga/vss-win32/Makefile.objs
> @@ -3,7 +3,7 @@
>  qga-vss-dll-obj-y += requester.o provider.o install.o
>  
>  obj-qga-vss-dll-obj-y = $(addprefix $(obj)/, $(qga-vss-dll-obj-y))
> -$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
> +$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all -fstack-protector-strong, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
>  
>  $(obj)/qga-vss.dll: LDFLAGS = -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
>  $(obj)/qga-vss.dll: $(obj-qga-vss-dll-obj-y) $(SRC_PATH)/$(obj)/qga-vss.def
> 

