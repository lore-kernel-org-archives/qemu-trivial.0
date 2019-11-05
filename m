Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iS2yi-0002RY-1c
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2019 12:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS2yd-0002Nb-0u
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 12:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS2yb-0004Xx-V1
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 12:50:46 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34039)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS2yZ-0004Wm-Li; Tue, 05 Nov 2019 12:50:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M42Ss-1iS2yG0Su0-0007FQ; Tue, 05 Nov 2019 18:50:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Fabien Chouteau <chouteau@adacore.com>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiri Gaisler <jiri@gaisler.se>
Subject: [PULL v2 2/3] hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
Date: Tue,  5 Nov 2019 18:50:09 +0100
Message-Id: <20191105175010.2591-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105175010.2591-1-laurent@vivier.eu>
References: <20191105175010.2591-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lZFxrSfyzft189ztgtj2zhDPSI/v8wne3TXsIYykJJGOhUsiUZI
 WUL5cdIywdu0OUa3r4YX6cB3Tht5LIMC0ClU0II1uDHDHXG37ReL8vF62QOrl1xOxWDZxAa
 yCqIAJHzVW28Cq2J7jJQs6dd+fOzaDuzfjzVCqTQsbJVnvlh+AledLIOc1Vel5LH8FUBnnh
 o47BZat4luIwytgGxrHcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:av6w0M/wZvM=:rDhXnAD9A6cpkNh2e0TgfK
 J5zOnZTmo/W2/DrEV1TxsmjMZKnl4JwjBQ2mVcpEMorM95RpraeHljKk6t3tDPN9htva00ZS+
 n0IKmM/g54Fxgbudpy2rNfAWupAwq8AOCr38O1wobl8Bp/lRRRUuj1DZn0hrORfW1BiiE1gRu
 GthE7ZJHo2MLLrMrhXBnGO7DPuPRa+1vEbtQk9FBU6jVR3g1Bmt3QddQzGLkiUOsMnAKkXybK
 iv9ZHOq6yKrXbOPUdJNLZqKmNu5QB8SvFBiRLk53kKWXg5DL8P3PSyFE44kUyIDBbCa2s3Ohc
 f94YctBbcL9YU5QBlW6Nwu4fdldc8HR0zwl23GHM8taAuVWhUUst0bAcbky1izqYVhnwHJn1R
 eQrdjr9KZX5ac4OXFu1KZrTwkQpp0tfr/HI2TkwfmnngyN4UksepaIhwp2Yjb0O7A88PqEUco
 4gDwDOA4U9bZNwEmwCgRAEhma1/YgZjpzKq8KwOH2+r85K5x7yNvLw9sSqzWLFA22rjhvchsv
 kDgAfgPtmB73k4lCOcLXEJpK0Wqgr/5KGZTohZmKSsuInPT/SYbnutSzOYKmnGtZQL5DBYf3a
 Ffz0lRXXmB1JvCyKrdlixwyOy5ZMKgh26Ca8J9olDZLuqEXYVP665ZS3UZpQ7giQkdwruVD1z
 VjZqrV5/+n8dISFBbupy5B/MNVImCkyCk1EuopkA7tj/QGjFM02nT+QEu1hmyrSQMJYIcyC1h
 v6AOWFzBqbucg6B8a7O4b488V2tPkikK+6Xj0FxRIchrNIh1TO3HeYrR72TWCmYvoiJsE3oVw
 MSVb44EyLNzkUgBzQ0nagEe+iBk+aTQLdvfM0Glo9oYSOyWcn6XykZEbWXbsOFtHKhG2fXxdO
 yV0/pVe89F9Tov60kVhYGU5ic5vtb/L80oLvPPMJo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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
X-List-Received-Date: Tue, 05 Nov 2019 17:50:48 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The Plug & Play region of the AHB/APB bridge can be accessed
by various word size, however the implementation is clearly
restricted to 32-bit:

  static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
  {
      APBPnp *apb_pnp = GRLIB_APB_PNP(opaque);

      return apb_pnp->regs[offset >> 2];
  }

Set the MemoryRegionOps::impl min/max fields to 32-bit, so
memory.c::access_with_adjusted_size() can adjust when the
access is not 32-bit.

This is required to run RTEMS on leon3, the grlib scanning
functions do byte accesses.

Reported-by: Jiri Gaisler <jiri@gaisler.se>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Message-Id: <20191025110114.27091-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/grlib_ahb_apb_pnp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index f3c015d2c35f..e230e2536361 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -242,6 +242,10 @@ static const MemoryRegionOps grlib_apb_pnp_ops = {
     .read       = grlib_apb_pnp_read,
     .write      = grlib_apb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
 };
 
 static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp)
-- 
2.21.0


