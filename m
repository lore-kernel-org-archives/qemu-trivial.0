Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eywto-0003Ts-0A
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 05:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywtl-0003R9-9q
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:52:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywti-0000HS-5e
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:52:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eywth-0000Gt-Sq; Thu, 22 Mar 2018 05:52:38 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2M9m5IK115612; Thu, 22 Mar 2018 09:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : subject :
	date : message-id : in-reply-to : references : mime-version :
	content-type : content-transfer-encoding; s=corp-2017-10-26;
	bh=8D9e6EWEtwDFebYhlR3rItJvcYkMOwXNXvQhfZ8k2C4=;
	b=VYWe80wXAo8UXnJuU2OOnm55slM0XuaaXF1N/D1nOfsDKREUn+ysr3L+7TKdUXlvlpkD
	UVJOv+vrcOiqU/0+EWauatKGixrXSQdIL9lHzSjiceY0tzR3jxS3QlBt68WrBnNL2JdH
	9Fkw2OZxOPeiyGEyNeumVifIG9VkqOkQ6O/Mv9Jq4oFLf9JllCjv871NKSSDvOJKtk2Y
	H/pHp4JC6UeXIPXgVO+qXTDRpeTIBeVxpImEFGUkr6eZevRJBGFgrPtjTI1NicLDdVZC
	yWxmt/KFqW2r+fi/XriVPXhhn6atVaowfPI1m/FAg5s/+83FovQDCtWXOqJ6y+7iiPyT
	hA== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
	by aserp2120.oracle.com with ESMTP id 2gva5x80jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Mar 2018 09:52:35 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2M9qZcZ025738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 22 Mar 2018 09:52:35 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w2M9qYLc009637;
	Thu, 22 Mar 2018 09:52:34 GMT
Received: from localhost.localdomain (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 22 Mar 2018 02:52:34 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: yuval.shaia@oracle.com, marcel@redhat.com, eblake@redhat.com,
	f4bug@amsat.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 22 Mar 2018 11:52:19 +0200
Message-Id: <20180322095220.9976-3-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180322095220.9976-1-yuval.shaia@oracle.com>
References: <20180322095220.9976-1-yuval.shaia@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8839
	signatures=668695
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1803200127
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2120.oracle.com id
	w2M9m5IK115612
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
Subject: [Qemu-trivial] [PATCH v2 for-2.12 2/3] hw/rdma: Use correct print
 format in CHK_ATTR macro
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
X-List-Received-Date: Thu, 22 Mar 2018 09:52:42 -0000

Macro should not cast the given variable to u64 instead it should use
the supplied format argument (fmt).

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/rdma/rdma_backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index f1a37ba4a2..0391a7dd95 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -656,8 +656,8 @@ void rdma_backend_destroy_qp(RdmaBackendQP *qp)
 #define CHK_ATTR(req, dev, member, fmt) ({ \
     pr_dbg("%s=3D"fmt","fmt"\n", #member, dev.member, req->member); \
     if (req->member > dev.member) { \
-        warn_report("%s =3D 0x%lx is higher than host device capability =
0x%lx", \
-                    #member, (uint64_t)req->member, (uint64_t)dev.member=
); \
+        warn_report("%s =3D "fmt" is higher than host device capability =
"fmt, \
+                    #member, req->member, dev.member); \
         req->member =3D dev.member; \
     } \
     pr_dbg("%s=3D"fmt"\n", #member, req->member); })
--=20
2.13.6


