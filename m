Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSxyd-0005Sg-OJ
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 01:05:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSxyZ-0005OY-5J
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSxyY-0002LC-5b
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:05:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60928 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fSxyR-0002Fx-2l; Wed, 13 Jun 2018 01:05:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9823A400141C;
	Wed, 13 Jun 2018 05:05:34 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-24.ams2.redhat.com [10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85F90201CB71;
	Wed, 13 Jun 2018 05:05:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	zhang.zhanghailiang@huawei.com, Markus Armbruster <armbru@redhat.com>,
	qemu-trivial@nongnu.org
Date: Wed, 13 Jun 2018 07:05:21 +0200
Message-Id: <1528866321-23886-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1528866321-23886-1-git-send-email-thuth@redhat.com>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 05:05:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 05:05:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [RFC PATCH 4/4] qemu-options: Do not show
 -enable-kvm and -enable-hax in the docs anymore
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
X-List-Received-Date: Wed, 13 Jun 2018 05:05:46 -0000

We've got three ways of enabling an accelerator: -machine accel=xyz,
-accel xyz and -enable-xyz. For new QEMU users, this must be very
confusing ("Which one do I have to use? Is there a difference between
the options?"). While -enable-kvm was useful in the past, there is no
real good reason for using it anymore today ("-accel kvm" is even less
to type than "-enable-kvm"), so let's decrease the confusing amount of
options in our documenation a little bit by removing the -enable-xyz
here. Note that the option itself is neither removed nor marked as
deprecated - since -enable-kvm is likely used in a lot of scripts and
since its code is easy to maintain, we should keep it around to avoid
to break old setups.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 PS: I guess Paolo won't like this patch ... let's try it anyway ;-)

 qemu-options.hx | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 0ec9cac..f33a81e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3414,25 +3414,11 @@ STEXI
 Set the filename for the BIOS.
 ETEXI
 
-DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
-    "-enable-kvm     enable KVM full virtualization support\n", QEMU_ARCH_ALL)
-STEXI
-@item -enable-kvm
-@findex -enable-kvm
-Enable KVM full virtualization support. This option is only available
-if KVM support is enabled when compiling.
-ETEXI
+HXCOMM -accel kvm should be used instead, thus this is not documented anymore
+DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, "", QEMU_ARCH_ALL)
 
-DEF("enable-hax", 0, QEMU_OPTION_enable_hax, \
-    "-enable-hax     enable HAX virtualization support\n", QEMU_ARCH_I386)
-STEXI
-@item -enable-hax
-@findex -enable-hax
-Enable HAX (Hardware-based Acceleration eXecution) support. This option
-is only available if HAX support is enabled when compiling. HAX is only
-applicable to MAC and Windows platform, and thus does not conflict with
-KVM.
-ETEXI
+HXCOMM -accel hax should be used instead, thus this is not documented anymore
+DEF("enable-hax", 0, QEMU_OPTION_enable_hax, "", QEMU_ARCH_I386)
 
 DEF("xen-domid", HAS_ARG, QEMU_OPTION_xen_domid,
     "-xen-domid id   specify xen guest domain id\n", QEMU_ARCH_ALL)
-- 
1.8.3.1


