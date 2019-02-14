Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEZ7-0002bm-BR
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYw-0002OT-3k
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYs-0002w6-Ti
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:14 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:45023)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYj-0002Ui-31; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Macf4-1hWKGR1PXm-00cAA8; Thu, 14 Feb 2019 11:47:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>
Date: Thu, 14 Feb 2019 11:47:13 +0100
Message-Id: <20190214104717.3543-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bn7cnTR+eiZqq/aJtEMxDtq3cvIV45cRfkXMqTtT6HyPuRIMM/0
	doczfiGvxhpwHIp0S+DIT2g3QKjdm7mLVRW84orkdkUp1kc/imDBIvSNmFo92maXOCULrWt
	u/obgNZgjiIweAKgG9QimHwG4JUVJ1PomhAfg/vSTRSvupOdTRpBt+oKGw1vtocB3S5HpAs
	7fSXE9WrNkVfjsf57p9/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LzwBIm6mYS4=:G9glWamBRQMrNFzjY0Mozv
	6MTLf8x01VKCKhk8OGu7r0ROQfe1s0xOjUx4XIj8qG0gS4mAqEvyIZw+DlSn/pAAQ27bQQVfA
	7W0nn/h6OdaHOiDUcmAb7e3j5khkwqFALQ166DCdfG3vlz6a0Aq38sbLSHEAvdPCOKFPgf88k
	xjXMjwY+ucexOVmccU6wT/43aBp2Bi6mJ2vXX9RkLtqi08aLkaWUDSc6/yUiwL+/LOZONr4W/
	UI+bw9ERLfW9NmIAa0ZGIIRY9mQaVcOzNPdRjN9Kb0Xzn20IMqyF3muXsunwiCKCdOCUm3TXV
	bfuy2WSyb17LapseAk9UeFY6rhI4AZiZjUo/oHZEsoWPlpHbksH7DZR5CoEvajdYTCMuec/ew
	9rA3zEKhSYth/hjrwGF8Xypb/d4wI+GXvVMISstVDfUukh/XNQANwlkJscwGshBSGLxvtFJtB
	GwVikWbbBrMk+CLFln3ajA67ksFvQriHLb0uK/8str4BrmHYGDgAw+LNFLzoDWISq9KN1Eupa
	Uji6L5eJDYJ5BEheTycErwz+pItzVIE9LHxXGzixPxozIz2P6luycrFzz48VjGMOp1fL4FykR
	YTbxrOSwkSOSBIj4nU5x77yMCBhmhjsYZGWYMTq5qUgRcTk5g14jH6hFJxyEr7uAFy6hy5ZEn
	FX9D+qx9k8zcBlRHPSYSZjxErLW7ff4TApubGNA961MqWLttynS9HaaEk79VmL21egPlybmTD
	jPRm4SUV8Pm7QKYbYBB6hK51+anfNBGF5ztDH7iMEBWyf09usVcDBgpzOzA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 10/14] kvm: Add kvm_set_ioeventfd* traces
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:16 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add a couple of traces around the kvm_set_ioeventfd* calls.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20190212134758.10514-4-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/kvm/kvm-all.c    | 3 +++
 accel/kvm/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4e1de942ce55..fd92b6f37547 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -657,6 +657,8 @@ static int kvm_set_ioeventfd_mmio(int fd, hwaddr addr, uint32_t val,
         .fd = fd,
     };
 
+    trace_kvm_set_ioeventfd_mmio(fd, (uint64_t)addr, val, assign, size,
+                                 datamatch);
     if (!kvm_enabled()) {
         return -ENOSYS;
     }
@@ -688,6 +690,7 @@ static int kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint16_t val,
         .fd = fd,
     };
     int r;
+    trace_kvm_set_ioeventfd_pio(fd, addr, val, assign, size, datamatch);
     if (!kvm_enabled()) {
         return -ENOSYS;
     }
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 58e98efe5dea..8841025d6895 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -12,5 +12,7 @@ kvm_irqchip_commit_routes(void) ""
 kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
 kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
 kvm_irqchip_release_virq(int virq) "virq %d"
+kvm_set_ioeventfd_mmio(int fd, uint64_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%" PRIx64 " val=0x%x assign: %d size: %d match: %d"
+kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%x val=0x%x assign: %d size: %d match: %d"
 kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
 
-- 
2.20.1


