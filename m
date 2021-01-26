Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4THZ-0006nV-IK
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jan 2021 13:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1l4T3g-0002Vp-O1
 for qemu-trivial@nongnu.org; Tue, 26 Jan 2021 13:27:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1l4T3c-00076K-Jw
 for qemu-trivial@nongnu.org; Tue, 26 Jan 2021 13:27:18 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QICWgA067186
 for <qemu-trivial@nongnu.org>; Tue, 26 Jan 2021 13:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GGbqhoia1Ppb2PK5coUwLvH0RzxzwK44XQYlUyQ5bv4=;
 b=JctHzX6rumDoVCaK6hCV1mXKzlQsSQ5/ubuXf8BbeUjtR09qhuJTHbIbn9LVz9fHU1MU
 higYNYPvWT2uzLpxs063+uhbsEvS7DeIk62DGGV2PD/Sb/6h7A8MFx/FJBP/AL43KIQV
 Z81Qrzl1dY6cTV7yEjZwzEZid7nDuSoY+k0ygFFtaatJN5KEugbr7gG3JClAi0CKTT4b
 yHwAN5UKRD7uQfYHpI2a8nfgrUo/P0bpUIFXOysrx0l/bXQvM+YHDz4fgwY50rg+hiyb
 JIgrfhnk9vBUfAchNgR6HGPIixr9MD47r5k1aKF3MdmO5jH9nFav6YOpif3wPwI7FyOr Zw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ar5f89qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 26 Jan 2021 13:27:14 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QIHkb7020841
 for <qemu-trivial@nongnu.org>; Tue, 26 Jan 2021 18:27:13 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 36a0t2g626-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 26 Jan 2021 18:27:13 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QIRC0W26149334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 18:27:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27D00C605A;
 Tue, 26 Jan 2021 18:27:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B7B2C6055;
 Tue, 26 Jan 2021 18:27:11 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.165.159])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 18:27:10 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-trivial@nongnu.org
Cc: Leonardo Garcia <lagarcia@br.ibm.com>
Subject: [PATCH] Fix typo in comment.
Date: Tue, 26 Jan 2021 15:26:51 -0300
Message-Id: <2833bf05e3c85267c5fefaab7326b58521da3896.1611685564.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_09:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=961 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260091
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Jan 2021 13:41:39 -0500
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
X-List-Received-Date: Tue, 26 Jan 2021 18:27:20 -0000

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 28c7d78172..d6d290e79f 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -285,7 +285,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
      * incremental memory mapping API via IOTLB API. For platform that
      * does not have IOMMU, there's no need to enable this feature
-     * which may cause unnecessary IOTLB miss/update trnasactions.
+     * which may cause unnecessary IOTLB miss/update transactions.
      */
     return vdev->dma_as != &address_space_memory &&
            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-- 
2.29.2


