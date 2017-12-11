Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOT3Q-0005HI-H6
	for mharc-qemu-trivial@gnu.org; Mon, 11 Dec 2017 13:43:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <george.kennedy@oracle.com>) id 1eORCB-0001mn-NE
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:44:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <george.kennedy@oracle.com>) id 1eORC9-0003VK-4n
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:44:47 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:44305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <george.kennedy@oracle.com>)
	id 1eORC8-0003U7-QT; Mon, 11 Dec 2017 11:44:45 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.21/8.16.0.21) with SMTP id
	vBBGgDGl189084; Mon, 11 Dec 2017 16:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : references
	: to : cc : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2017-10-26;
	bh=FOAHM0FQrftOqD63P0uyDV184yr4rgRLG566PY+iZmc=;
	b=kIuoewedI9NAuNqG1i98wc+fvTYl3MQwUwmz2AbW8/FZt9D52ARB3PVl02W99Vg8u78Q
	03G2Ad/QuP7KRpME6JvkUJA/ZjHf9ZxsfXaU9TvDF9tAm8C5kp9xqqBOR35SfH0QkVg7
	O32+Fu6D7CvmGr1PB9gNMqZ+Z4SPQcAqdJBfU0dwUIWzyphTrgmtfvO00BQ3nytVBQhQ
	sAeDKP5R/TUxgCFD4UoAmEQHw2nJb5h+cWYEyrotHZlm8CANYz1SnMVWSjrTV9tNKbMJ
	0IPtFnNU0qS4W7lNpIgD8cuQvHeyJmaDAZHf3ruzPIZEobl+w7Ve7yj+GtRhGDflj5vy
	yg== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp2130.oracle.com with ESMTP id 2eswny82qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Dec 2017 16:44:42 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id vBBGifSI032151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 11 Dec 2017 16:44:41 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id vBBGiev2017002;
	Mon, 11 Dec 2017 16:44:41 GMT
Received: from [10.152.35.216] (/10.152.35.216)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 11 Dec 2017 08:44:40 -0800
References: <a2b410dd-1150-16a4-9376-069117a14c98@oracle.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
X-Forwarded-Message-Id: <a2b410dd-1150-16a4-9376-069117a14c98@oracle.com>
Message-ID: <5b24ac58-738a-ac39-f4ed-6cffb3727a26@oracle.com>
Date: Mon, 11 Dec 2017 11:45:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <a2b410dd-1150-16a4-9376-069117a14c98@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8742
	signatures=668644
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=865
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1712110248
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.79
X-Mailman-Approved-At: Mon, 11 Dec 2017 13:43:50 -0500
Subject: [Qemu-trivial] [PATCH] lsi_scsi: add support for PPR Extended
 Message
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
X-List-Received-Date: Mon, 11 Dec 2017 16:44:48 -0000

The LSI 53c895a code does not handle the PPR Extended Message. Add 
support to handle PPR Extended Message like SDTR and WDTR are handled. 
That is, to skip past the message bytes and ignore the message.

---
  hw/scsi/lsi53c895a.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 595c260..1e02a89 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -961,6 +961,10 @@ static void lsi_do_msgout(LSIState *s)
                  DPRINTF("WDTR (ignored)\n");
                  lsi_skip_msgbytes(s, 1);
                  break;
+            case 4:
+                DPRINTF("PPR (ignored)\n");
+                lsi_skip_msgbytes(s, 5);
+                break;
              default:
                  goto bad;
              }
-- 
1.8.3.1


