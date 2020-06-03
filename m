Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgVux-0003Nz-4h
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 12:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgVuv-0003MS-ND
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 12:07:01 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32791
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgVuv-0001fJ-02
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 12:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591200419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5g0xWKQHK3OchzfH5fA/OUO7nHT8833CftAc9cSmOI0=;
 b=M18DGf+K9/N9k3KRy8qj1tPEISKfi8wfpgXURaiCn3jIdcCoaShXFVmiUmBAv3OjDLCYOm
 kn9eW9LHQJlpBMUqsXe+QmRr80HfO4NrHWnG2UbBpTkkKC38PDIIjIYkYWWE5fHPOyj0ft
 G57rRpHOdFDmwZDx7Kq6bAJbfyDirBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-cDavETnrNDaZM4xnKFeQ3g-1; Wed, 03 Jun 2020 12:06:55 -0400
X-MC-Unique: cDavETnrNDaZM4xnKFeQ3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF55718A0764;
 Wed,  3 Jun 2020 16:06:53 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E41F5C298;
 Wed,  3 Jun 2020 16:06:50 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] linux-user/mmap: Fix Clang 'type-limit-compare'
 warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200503113220.30808-1-f4bug@amsat.org>
 <20200503113220.30808-3-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7529763d-1f4a-5077-14ed-98753c8db288@redhat.com>
Date: Wed, 3 Jun 2020 11:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200503113220.30808-3-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jun 2020 16:07:01 -0000

On 5/3/20 6:32 AM, Philippe Mathieu-Daudé wrote:
> When building with Clang 10 on Fedora 32, we get:
> 
>      CC      linux-user/mmap.o
>    linux-user/mmap.c:720:49: error: result of comparison 'unsigned long' > 18446744073709551615 is always false [-Werror,-Wtautological-type-limit-compare]
>            if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
>                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
> 
> Fix by restricting the check for when target sizeof(abi_ulong) is
> smaller than target sizeof(unsigned long).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/mmap.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index e378033797..b14652d894 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -714,6 +714,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>               errno = ENOMEM;
>               host_addr = MAP_FAILED;
>           }
> +#if TARGET_ABI_BITS < TARGET_LONG_BITS
>           /* Check if address fits target address space */
>           if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {

Instead of using #if, the following suffices to shut up clang:

diff --git c/linux-user/mmap.c w/linux-user/mmap.c
index e37803379747..8d9ba201625d 100644
--- c/linux-user/mmap.c
+++ w/linux-user/mmap.c
@@ -715,7 +715,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong 
old_size,
              host_addr = MAP_FAILED;
          }
          /* Check if address fits target address space */
-        if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
+        if ((unsigned long)host_addr > (abi_ulong)-1 - new_size) {
              /* Revert mremap() changes */
              host_addr = mremap(g2h(old_addr), new_size, old_size, flags);
              errno = ENOMEM;


That is, it is no longer a tautological type compare if you commute the 
operations so that neither side is a compile-time constant.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


