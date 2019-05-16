Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRE5d-00024E-9C
	for mharc-qemu-trivial@gnu.org; Thu, 16 May 2019 06:58:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hRE5b-00021u-L5
	for qemu-trivial@nongnu.org; Thu, 16 May 2019 06:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hRE5W-0002BB-Lf
	for qemu-trivial@nongnu.org; Thu, 16 May 2019 06:58:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hRE5W-000278-AX
	for qemu-trivial@nongnu.org; Thu, 16 May 2019 06:58:14 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4GAvpVi026287
	for <qemu-trivial@nongnu.org>; Thu, 16 May 2019 06:58:12 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sh5493u8g-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 16 May 2019 06:58:11 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <groug@kaod.org>;
	Thu, 16 May 2019 11:58:09 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 16 May 2019 11:58:06 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4GAw5Ao23199850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 16 May 2019 10:58:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 970AB52050;
	Thu, 16 May 2019 10:58:05 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.156.103])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 720ED52051;
	Thu, 16 May 2019 10:58:05 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Thu, 16 May 2019 12:58:05 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051610-0008-0000-0000-000002E74844
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051610-0009-0000-0000-00002253ECCA
Message-Id: <155800428514.543845.17558475870097990036.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=659 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905160074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-trivial] [PATCH] migration: Fix typo in migrate_add_blocker()
 error message
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
X-List-Received-Date: Thu, 16 May 2019 10:58:20 -0000

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 migration/migration.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 609e0df5d0c0..c15e75e0eebe 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1714,7 +1714,7 @@ int migrate_add_blocker(Error *reason, Error **errp)
     if (only_migratable) {
         error_propagate_prepend(errp, error_copy(reason),
                                 "disallowing migration blocker "
-                                "(--only_migratable) for: ");
+                                "(--only-migratable) for: ");
         return -EACCES;
     }
 


