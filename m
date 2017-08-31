Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMq3-0003BH-I6
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:36:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpw-00036F-5g
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpv-0006fd-9U
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMpq-0006Xi-H6; Thu, 31 Aug 2017 06:36:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BDFAC047B68;
	Thu, 31 Aug 2017 10:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3BDFAC047B68
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4EAD841C7;
	Thu, 31 Aug 2017 10:36:24 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 31 Aug 2017 12:34:27 +0200
Message-Id: <20170831103432.6007-25-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 31 Aug 2017 10:36:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 24/29] kvm: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:36:37 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 linux-headers/asm-x86/kvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index c2824d02ba..1930b95bcb 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -153,7 +153,7 @@ struct kvm_sregs {
 	__u64 cr0, cr2, cr3, cr4, cr8;
 	__u64 efer;
 	__u64 apic_base;
-	__u64 interrupt_bitmap[(KVM_NR_INTERRUPTS + 63) / 64];
+	__u64 interrupt_bitmap[DIV_ROUND_UP(KVM_NR_INTERRUPTS, 64)];
 };
=20
 /* for KVM_GET_FPU and KVM_SET_FPU */
--=20
2.14.1.146.gd35faa819


