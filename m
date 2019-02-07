Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grrTt-00032L-1w
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 16:45:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <muriloo@linux.ibm.com>) id 1grof2-0005kz-42
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 13:44:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <muriloo@linux.ibm.com>) id 1groez-0004hw-Cc
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 13:44:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34826
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <muriloo@linux.ibm.com>)
	id 1groez-0004g8-7D
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 13:44:29 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x17IdUiq138166
	for <qemu-trivial@nongnu.org>; Thu, 7 Feb 2019 13:44:27 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qgt4brb3t-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 07 Feb 2019 13:44:26 -0500
Received: from localhost
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <muriloo@linux.ibm.com>;
	Thu, 7 Feb 2019 18:44:25 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 7 Feb 2019 18:44:22 -0000
Received: from b03ledav005.gho.boulder.ibm.com
	(b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x17IiLGn22020112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 7 Feb 2019 18:44:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D5FBBE058;
	Thu,  7 Feb 2019 18:44:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93986BE051;
	Thu,  7 Feb 2019 18:44:19 +0000 (GMT)
Received: from kermit.br.ibm.com (unknown [9.18.235.184])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  7 Feb 2019 18:44:19 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: mopsfelder@gmail.com, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org
Date: Thu,  7 Feb 2019 16:43:46 -0200
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19020718-0012-0000-0000-00001706AE33
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010555; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000279; SDB=6.01157713; UDB=6.00604011;
	IPR=6.00938244; 
	MB=3.00025481; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-07 18:44:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020718-0013-0000-0000-0000561DD57E
Message-Id: <20190207184346.6840-1-muriloo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1902070140
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-Mailman-Approved-At: Thu, 07 Feb 2019 16:45:11 -0500
Subject: [Qemu-trivial] [PATCH] docs/devel/testing: Add -a option to usermod
 command on docker setup
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
X-List-Received-Date: Thu, 07 Feb 2019 18:44:33 -0000

The option -G of usermod command will remove user from other groups
not listed, i.e.: $USER will belong only to group 'docker' after
following the documentation as is.

From usermod(8) manual page:

    If the user is currently a member of a group which is not listed,
    the user will be removed from the group. This behaviour can be
    changed via the -a option, which appends the user to the current
    supplementary group list.

This patch improves the situation by adding the -a option to the
usermod command, which will just append user to the supplementary
group list.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
 docs/devel/testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 18e2c0868a..135743a2bf 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -301,7 +301,7 @@ An alternative method to set up permissions is by adding the current user to
 .. code::
 
   $ sudo groupadd docker
-  $ sudo usermod $USER -G docker
+  $ sudo usermod $USER -a -G docker
   $ sudo chown :docker /var/run/docker.sock
 
 Note that any one of above configurations makes it possible for the user to
-- 
2.20.1


