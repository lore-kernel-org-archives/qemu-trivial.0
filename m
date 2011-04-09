Received: from mailman by lists.gnu.org with archive (Exim 4.43)
	id 1Q8uEn-0000oY-HT
	for mharc-qemu-trivial@gnu.org; Sun, 10 Apr 2011 08:59:33 -0400
Received: from [140.186.70.92] (port=37222 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.43) id 1Q8NH9-0004HS-Td
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2011 21:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jljusten@gmail.com>) id 1Q8NGl-0007XQ-0D
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2011 21:47:25 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:59619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jljusten@gmail.com>) id 1Q8NGk-0007Wm-OV
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2011 21:47:22 -0400
Received: by pvg3 with SMTP id 3so1769254pvg.4
	for <qemu-trivial@nongnu.org>; Fri, 08 Apr 2011 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:x-google-sender-delegation
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=7V5EBsR3rvYR0g1jTzTO+RXAK78Ykrq5Jh6ZY+dSldA=;
	b=gbAjk6k+h0MiacAH+jnbUfduVUIrcVriPeMiPIIbGhbA7orOd6Kw3pHzQx9QKmUwz9
	Nhuqjyl2RK7q73/HfuVmFYvHbC4f81X9Wuqjw8GWwBBU2aQraRDOMm9dO75Wdt2Nf1db
	Gn/08n+SDg6L+1VI0J+J7bChPf1fMcPbPbSS8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:x-google-sender-delegation:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SQ8d8StYV/e7QVBMwatDLghD89jwxvcNlh8oaET4ElcxA+81XHb3Hi4/mAzm2pdBZT
	bBXmsMkr1cmFWo3kKl4r1JOKwZV/xBmqIZXjHa8Fc9sY/3isXB8fVIX0aJNgCmyh1Tpg
	2nCnZAtL2MKmmCffsMGsuiA4jd22FrEsDDHMU=
MIME-Version: 1.0
Received: by 10.142.202.18 with SMTP id z18mr2451543wff.438.1302313637700;
	Fri, 08 Apr 2011 18:47:17 -0700 (PDT)
Sender: aljusten@gmail.com
X-Google-Sender-Delegation: aljusten@gmail.com
Received: by 10.68.55.230 with HTTP; Fri, 8 Apr 2011 18:47:17 -0700 (PDT)
In-Reply-To: <BANLkTi=_YS-pDSTh85TH6rWURDJzrCa4FA@mail.gmail.com>
References: <1301861786-6637-1-git-send-email-jordan.l.justen@intel.com>
	<BANLkTi=_YS-pDSTh85TH6rWURDJzrCa4FA@mail.gmail.com>
Date: Fri, 8 Apr 2011 18:47:17 -0700
X-Google-Sender-Auth: UN-8syRFjRwf0tRkifAkWPRkHZ0
Message-ID: <BANLkTimrWe6J2Ormy8EHxR8CXhZLM1ZE9Q@mail.gmail.com>
From: Jordan Justen <jljusten@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
X-Mailman-Approved-At: Sun, 10 Apr 2011 08:59:32 -0400
Subject: [Qemu-trivial] Fwd: [Qemu-devel] [PATCH] hw/pflash_cfi02: Fix lazy
	reset of ROMD mode
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: qemu-trivial.nongnu.org
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Apr 2011 01:47:53 -0000

Is this a 'trivial patch,' or does hw/pflash_cfi02 have an active maintaine=
r?

Thanks,

-Jordan

---------- Forwarded message ----------
From: Jordan Justen <jordan.l.justen@intel.com>
Date: Sun, Apr 3, 2011 at 13:16
Subject: [Qemu-devel] [PATCH] hw/pflash_cfi02: Fix lazy reset of ROMD mode
To: qemu-devel@nongnu.org
Cc: Jordan Justen <jordan.l.justen@intel.com>


When checking pfl->rom_mode for when to lazily reenter ROMD mode,
the value was check was the opposite of what it should have been.
This prevent the part from returning to ROMD mode after a write
was made to the CFI rom region.

Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
=A0hw/pflash_cfi02.c | =A0 =A02 +-
=A01 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index 30c8aa4..370c5ee 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -112,7 +112,7 @@ static uint32_t pflash_read (pflash_t *pfl,
target_phys_addr_t offset,

=A0 =A0 DPRINTF("%s: offset " TARGET_FMT_plx "\n", __func__, offset);
=A0 =A0 ret =3D -1;
- =A0 =A0if (pfl->rom_mode) {
+ =A0 =A0if (!pfl->rom_mode) {
=A0 =A0 =A0 =A0 /* Lazy reset of to ROMD mode */
=A0 =A0 =A0 =A0 if (pfl->wcycle =3D=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0 pflash_register_memory(pfl, 1);
--
1.7.1

