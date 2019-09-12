Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8PbY-0007U9-BY
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2019 09:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1i8PbU-0007Sf-1n
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 09:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1i8PbS-0006lc-3Q
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 09:57:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42498)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1i8PbR-0006ky-8C
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 09:57:41 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CDvXRx096617
 for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2019 09:57:40 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyp6vj7jg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2019 09:57:39 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-trivial@nongnu.org> from <groug@kaod.org>;
 Thu, 12 Sep 2019 14:57:30 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Sep 2019 14:57:28 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8CDvRpm57737216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 13:57:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42DC942041;
 Thu, 12 Sep 2019 13:57:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 107C442045;
 Thu, 12 Sep 2019 13:57:27 +0000 (GMT)
Received: from bahia.tls.ibm.com (unknown [9.101.4.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 13:57:26 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 15:57:26 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091213-4275-0000-0000-00000364E467
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091213-4276-0000-0000-000038773F85
Message-Id: <156829664683.2070256.13400788010568373502.stgit@bahia.tls.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=768 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120148
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-trivial] [PATCH] kvm: Fix typo in header of
 kvm_device_access()
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
X-List-Received-Date: Thu, 12 Sep 2019 13:57:46 -0000

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/sysemu/kvm.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 909bcd77cf82..fd674772ab31 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -308,7 +308,7 @@ int kvm_vm_check_attr(KVMState *s, uint32_t group, uint64_t attr);
 int kvm_device_check_attr(int fd, uint32_t group, uint64_t attr);
 
 /**
- * kvm_device_access - set or get value of a specific vm attribute
+ * kvm_device_access - set or get value of a specific device attribute
  * @fd: The device file descriptor
  * @group: the group
  * @attr: the attribute of that group to set or get


