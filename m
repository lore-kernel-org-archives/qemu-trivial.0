Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLEPi-0007EM-MD
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2014 11:11:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLEPW-0006oX-F9
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 11:11:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLEPQ-0001PE-FJ
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 11:11:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WLEPE-0001Lx-4B; Wed, 05 Mar 2014 11:10:52 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s25GAl17007543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Mar 2014 11:10:47 -0500
Received: from dell-pet610-01.lab.eng.brq.redhat.com
	(dell-pet610-01.lab.eng.brq.redhat.com [10.34.42.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s25GAgBs013206; Wed, 5 Mar 2014 11:10:42 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Mar 2014 17:10:38 +0100
Message-Id: <1394035840-1584-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s25GAl17007543
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org,
	eblake@redhat.com, coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru,
	mreitz@redhat.com, aliguori@amazon.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	afaerber@suse.de
Subject: [Qemu-trivial] [PATCH v3 0/2] convert -m to QemuOpts
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
X-List-Received-Date: Wed, 05 Mar 2014 16:11:16 -0000


changes since v2 suggested by Andreas F=C3=A4rber:
 - s/fprintf/error_report/
 - rename 'mem' option to 'size'
 - CCing to qemu-trivial

changes since v1:
 - check for overflow
 - check for empty mem=3D"" case
 - reshuffle code to avoid conflicts with another series on list
 - some style/typo fixes

changes since RFC:
 - resolved conflict with error_abort change
   in qemu_get_machine_opts()


Igor Mammedov (1):
  vl: convert -m to QemuOpts

Paolo Bonzini (1):
  qemu-option: introduce qemu_find_opts_singleton

 include/qemu/config-file.h |    2 +
 qemu-options.hx            |    9 +++--
 util/qemu-config.c         |   14 +++++++
 vl.c                       |   82 +++++++++++++++++++++++++++++++-------=
------
 4 files changed, 80 insertions(+), 27 deletions(-)


