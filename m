Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW3ti-000646-G6
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 10:15:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW3tf-00063k-P8
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:15:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW3tb-0001oD-AH
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:15:35 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:36380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YW3tb-0001n4-39; Thu, 12 Mar 2015 10:15:31 -0400
Received: by wiwh11 with SMTP id h11so37713310wiw.1;
	Thu, 12 Mar 2015 07:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=RnWGEWZA3HhKpPXD7GSs1dMqi3tAujRmwJkF/p8X3sc=;
	b=NWhYnqw+lEEid3aaiTDg+ULTTyOtdw6c2Ec6lM6xM/EhEjb2OanDCmzA/R67JbFGh9
	/EYfp52HTDpX9zjHonKhE5BHxRXvSgnT4/5B99U6TcSw3VE7GJTW/jtBh6mKiC+g94lY
	D85Oo5qd2+IVWkqgvi3H+U+dvjYNjtIbndyw7Rv8+L0mKxo31SXsepzzSQ+a7gvUABYD
	4UIgscthvLSLDGSJLmDViAFN5OQvjRSgGSN4qfb63GtYdTa9ZoDT+II6EkLM+lTu1jrc
	69Gfz4PdVPhMxYRSdt55N5cRDzNo7ihG/angd1IIG41ERTeSUOFujTmQc3Kzy9ZJOhUh
	LYvQ==
X-Received: by 10.194.19.197 with SMTP id h5mr86132077wje.109.1426169729050;
	Thu, 12 Mar 2015 07:15:29 -0700 (PDT)
Received: from [192.168.10.150] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124])
	by mx.google.com with ESMTPSA id 17sm10205230wjt.45.2015.03.12.07.15.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 07:15:27 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55019F7C.3030905@redhat.com>
Date: Thu, 12 Mar 2015 15:15:24 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Joseph Hindin <jhindin@daynix.com>, qemu-devel@nongnu.org
References: <1426156529-31276-1-git-send-email-jhindin@daynix.com>
	<1426156529-31276-2-git-send-email-jhindin@daynix.com>
In-Reply-To: <1426156529-31276-2-git-send-email-jhindin@daynix.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] When building qga-vss.dll with 64-bit
 MinGW toolchain,
 qga-vss.dll linking fails with unresolved symbols from libssp,
 stack protection support, like the  following message:
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
X-List-Received-Date: Thu, 12 Mar 2015 14:15:37 -0000



On 12/03/2015 11:35, Joseph Hindin wrote:
> .../qga/vss-win32/install.cpp:52: undefined reference to `__stack_chk_fail'
> 
> The patch fixes the problem by adding -fstack-protector-all option to the
> linker options' list.
> 
> Signed-off-by: Joseph Hindin <jhindin@daynix.com>
> ---
>  qga/vss-win32/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/vss-win32/Makefile.objs b/qga/vss-win32/Makefile.objs
> index 6a69d50..3b296f0 100644
> --- a/qga/vss-win32/Makefile.objs
> +++ b/qga/vss-win32/Makefile.objs
> @@ -5,7 +5,7 @@ qga-vss-dll-obj-y += requester.o provider.o install.o
>  obj-qga-vss-dll-obj-y = $(addprefix $(obj)/, $(qga-vss-dll-obj-y))
>  $(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
>  
> -$(obj)/qga-vss.dll: LDFLAGS = -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
> +$(obj)/qga-vss.dll: LDFLAGS =  -fstack-protector-all -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
>  $(obj)/qga-vss.dll: $(obj-qga-vss-dll-obj-y) $(SRC_PATH)/$(obj)/qga-vss.def
>  	$(call quiet-command,$(CXX) -o $@ $(qga-vss-dll-obj-y) $(SRC_PATH)/qga/vss-win32/qga-vss.def $(CXXFLAGS) $(LDFLAGS),"  LINK  $(TARGET_DIR)$@")
>  
> 

Sorry for the late reply to v1.  I left a few other comments there.

Basically, the Makefile is trying to disable ssp, in the line above the
one you touched.  Either we can support ssp, and then that incomplete
effort must be removed, or we cannot, and then your fix may hide other bugs.

Paolo

