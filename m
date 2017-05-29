Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dFPIn-0001x5-2F
	for mharc-qemu-trivial@gnu.org; Mon, 29 May 2017 14:22:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joserz@linux.vnet.ibm.com>) id 1dFNYn-0004iR-M9
	for qemu-trivial@nongnu.org; Mon, 29 May 2017 12:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joserz@linux.vnet.ibm.com>) id 1dFNYk-0000hX-H1
	for qemu-trivial@nongnu.org; Mon, 29 May 2017 12:30:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <joserz@linux.vnet.ibm.com>)
	id 1dFNYk-0000hF-7t
	for qemu-trivial@nongnu.org; Mon, 29 May 2017 12:30:22 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v4TGTiJo105055
	for <qemu-trivial@nongnu.org>; Mon, 29 May 2017 12:30:20 -0400
Received: from e24smtp01.br.ibm.com (e24smtp01.br.ibm.com [32.104.18.85])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2arpxxggkm-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 29 May 2017 12:30:20 -0400
Received: from localhost
	by e24smtp01.br.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <joserz@linux.vnet.ibm.com>;
	Mon, 29 May 2017 13:30:17 -0300
Received: from d24relay04.br.ibm.com (9.18.232.146)
	by e24smtp01.br.ibm.com (10.172.0.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 29 May 2017 13:30:16 -0300
Received: from d24av05.br.ibm.com (d24av05.br.ibm.com [9.18.232.44])
	by d24relay04.br.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v4TGUF7C50724986; Mon, 29 May 2017 13:30:15 -0300
Received: from d24av05.br.ibm.com (localhost [127.0.0.1])
	by d24av05.br.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	v4TGUG5D020271; Mon, 29 May 2017 13:30:16 -0300
Received: from pacoca.ibm.com ([9.80.236.119])
	by d24av05.br.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	v4TGUERC020230; Mon, 29 May 2017 13:30:15 -0300
From: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon, 29 May 2017 13:30:04 -0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-MML: disable
x-cbid: 17052916-1523-0000-0000-000002A3FB99
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052916-1524-0000-0000-00002A3A844A
Message-Id: <1496075404-8845-1-git-send-email-joserz@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1705290310
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Mon, 29 May 2017 14:21:59 -0400
Subject: [Qemu-trivial] [PATCH] simpletrace: Improve the error message if
 event is not declared
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
X-List-Received-Date: Mon, 29 May 2017 16:30:26 -0000

Today, if we use a trace-event file which does not declare an event
existing in the log file we'll get the following error:

$ scripts/simpletrace.py trace-events trace-68508
Traceback (most recent call last):
  File "scripts/simpletrace.py", line 242, in <module>
    run(Formatter())
  File "scripts/simpletrace.py", line 217, in run
    process(events, sys.argv[2], analyzer, read_header=read_header)
  File "scripts/simpletrace.py", line 192, in process
    for rec in read_trace_records(edict, log):
  File "scripts/simpletrace.py", line 107, in read_trace_records
    rec = read_record(edict, idtoname, fobj)
  File "scripts/simpletrace.py", line 71, in read_record
    return get_record(edict, idtoname, rechdr, fobj)
  File "scripts/simpletrace.py", line 45, in get_record
    event = edict[name]
KeyError: 'qemu_mutex_locked'

This patch improves this error by adding a hint instead of just that
KeyError log:

$ scripts/simpletrace.py trace-events trace-68508
'qemu_mutex_locked' event is logged but is not declared in the trace
events file, try using trace-events-all instead.

Signed-off-by: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
---
 scripts/simpletrace.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index d60b3a0..f1be6e4 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -42,7 +42,15 @@ def get_record(edict, idtoname, rechdr, fobj):
         event_id = rechdr[0]
         name = idtoname[event_id]
         rec = (name, rechdr[1], rechdr[3])
-        event = edict[name]
+        try:
+            event = edict[name]
+        except KeyError, e:
+            import sys
+            sys.stderr.write('%s event is logged but is not declared ' \
+                             'in the trace events file, try using ' \
+                             'trace-events-all instead.\n' % str(e))
+            sys.exit(1)
+
         for type, name in event.args:
             if is_string(type):
                 l = fobj.read(4)
-- 
2.7.4


