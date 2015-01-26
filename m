Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhb7-0004ts-Ml
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:12:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhb4-0004p4-Eq
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhay-0001Yg-5F
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:46 -0500
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236]:47734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhas-0001Qr-0G; Mon, 26 Jan 2015 06:12:34 -0500
Received: by mail-we0-f182.google.com with SMTP id l61so8353016wev.13;
	Mon, 26 Jan 2015 03:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=q7rU2KvNapRWmDOfZyQdvjaa74D+rE1Oz/nrHt2yjtA=;
	b=rr37ZAm3NwzGnr7RjTuULwad5hrW++r5ELrauz3kN87gtmE4RlXiKac0Qx3+7ZcNXS
	4bhkWm5yHpPH7sbr8bA31b98Yur6PugBWBIDUHRTXvv0F7Hk6kVM4sVD67ggEWxpcf+J
	+m13cbO8FWY0a2v1zUq4eyD5hI1Eptwxi8w+N05IKnRZ9g7KcIvr6umySj4aMEIbjnqp
	X/K5l5q5jCF7NQuHPKxyfi61Ag79RICNCHYm0AuL5YY9cbKa8H4/4H2UA1eOvP+YO5UM
	9AEosMs9X7EV3WvEKygzNIHoZ9QJEr8eGMDPVpcfomVy4q8JSXvokcXg1mlourp7PeDE
	IN8w==
X-Received: by 10.180.72.199 with SMTP id f7mr31483428wiv.58.1422270753072;
	Mon, 26 Jan 2015 03:12:33 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:31 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:20 +0100
Message-Id: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::236
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 0/7] Six coverity fixes and a cleanup
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
X-List-Received-Date: Mon, 26 Jan 2015 11:12:47 -0000

Patch 2 is the cleanup.  The other six patches make the tcg, utils and
migration components clean.

Paolo Bonzini (7):
  cpu-exec: drop dead assignment
  cpu-exec: simplify icount code
  uri: avoid NULL arguments to strcmp
  qemu-sockets: improve error reporting in unix_listen_opts
  cutils: refine strtol error handling in parse_debug_env
  aes: remove a dead return statement
  migration: do floating-point division

 cpu-exec.c            | 12 +++---------
 migration/migration.c |  2 +-
 util/aes.c            |  2 +-
 util/cutils.c         |  4 ++--
 util/qemu-sockets.c   | 24 ++++++++++++++++++------
 util/uri.c            |  4 +++-
 6 files changed, 28 insertions(+), 20 deletions(-)

-- 
1.8.3.1


