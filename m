Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TTcpa-0000j9-Aa
	for mharc-qemu-trivial@gnu.org; Wed, 31 Oct 2012 14:15:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1TTcpX-0000ai-Sm
	for qemu-trivial@nongnu.org; Wed, 31 Oct 2012 14:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1TTcpT-0006HQ-Nc
	for qemu-trivial@nongnu.org; Wed, 31 Oct 2012 14:15:55 -0400
Received: from mail-vb0-f45.google.com ([209.85.212.45]:35244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1TTcpM-0006Du-0b; Wed, 31 Oct 2012 14:15:44 -0400
Received: by mail-vb0-f45.google.com with SMTP id p1so1745895vbi.4
	for <multiple recipients>; Wed, 31 Oct 2012 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V5gzlMDh0wSMmrHuafHaivilLjhRkqduh6yPraap8uM=;
	b=W5jPitBd6QzcxdrfmoEVZNmz2B3GzlvHin8fu4H5ksJr/HFSVhdXXT7dbxyfRTFwkX
	+Au64vIW48yWAUF3ka38J9xRuDRbhnQ2y5d3KTg50bE2c0riwNrq0Zu2IS/1oHR4wesj
	LIYOrOoK1iCIUM1z1hWqiwdXPRk7Q2Wp6cySEXPlqBA7AosVYvgfgrwlpz/AznYTvdcl
	QZvJkE4NJmFLc2jIor8MBwIvp9Lb8eBY33LTaFBsajtRX4UItLgK3oBCzQm87UNCsG5N
	Tl4CJhe5/ZclJ+b6qB2QVl3wxYb/QwbGWsNgg6kRr9z1bbdESmTxXY4wsU5f0QAaUm93
	Z42w==
Received: by 10.58.23.169 with SMTP id n9mr63050771vef.58.1351707342727;
	Wed, 31 Oct 2012 11:15:42 -0700 (PDT)
Received: from hedwig.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.5])
	by mx.google.com with ESMTPS id w17sm2487145vdf.16.2012.10.31.11.15.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 11:15:41 -0700 (PDT)
Date: Wed, 31 Oct 2012 14:15:39 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20121031181538.GC29280@hedwig.ini.cmu.edu>
References: <20121030172039.GN29280@hedwig.ini.cmu.edu>
	<20121031080351.GC1116@stefanha-thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121031080351.GC1116@stefanha-thinkpad>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, rene@exactcode.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH v2] e1000: pre-initialize RAH/RAL registers
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
X-List-Received-Date: Wed, 31 Oct 2012 18:15:57 -0000

Some guest operating systems' drivers (Mac OS X in particular) fail to
properly initialize the Receive Address registers (probably expecting
them to be pre-initialized by an earlier component, such as a specific
proprietary BIOS). This patch pre-initializes the RA registers, allowing
OS X networking to function properly. Other guest operating systems are
not affected, and free to (re)initialize these registers during boot.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---

On Wed, Oct 31, 2012 at 09:03:51AM +0100, Stefan Hajnoczi wrote:
> Please use 4 space indentation (QEMU coding style).

My bad, fixed in this version.

> > +  memmove(&d->mac_reg[RA], &d->conf.macaddr, sizeof(struct MACAddr));
>
> When the host is big-endian the filter code will byteswap and the MAC address
> will not match:
> 
>   for (rp = s->mac_reg + RA; rp < s->mac_reg + RA + 32; rp += 2) {
>       if (!(rp[1] & E1000_RAH_AV))
>           continue;
>       ra[0] = cpu_to_le32(rp[0]);
>       ra[1] = cpu_to_le32(rp[1]);
>       if (!memcmp(buf, (uint8_t *)ra, 6)) {

OK, I guess I could just memmove from d->eeprom_data instead of
d->conf.macaddr.a, on the assumption that pci_e1000_init() already
did the endian-proofing for me. But probably the safest/most paranoid
method is best, see below...

Thanks,
  Gabriel

 hw/e1000.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/hw/e1000.c b/hw/e1000.c
index e4f1ffe..a29b844 100644
--- a/hw/e1000.c
+++ b/hw/e1000.c
@@ -266,6 +266,8 @@ rxbufsize(uint32_t v)
 static void e1000_reset(void *opaque)
 {
     E1000State *d = opaque;
+    uint8_t *macaddr = d->conf.macaddr.a;
+    int i;
 
     qemu_del_timer(d->autoneg_timer);
     memset(d->phy_reg, 0, sizeof d->phy_reg);
@@ -278,6 +280,14 @@ static void e1000_reset(void *opaque)
     if (d->nic->nc.link_down) {
         e1000_link_down(d);
     }
+
+    /* Some guests expect pre-initialized RAH/RAL (AddrValid flag + MACaddr) */
+    d->mac_reg[RA] = 0;
+    d->mac_reg[RA+1] = E1000_RAH_AV;
+    for (i = 0; i < 4; i++) {
+        d->mac_reg[RA] |= macaddr[i]<<(8*i);
+        d->mac_reg[RA+1] |= (i < 2) ? macaddr[i+4]<<(8*i) : 0;
+    }
 }
 
 static void
-- 
1.7.7.6


