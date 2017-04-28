Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d469g-0001vq-8c
	for mharc-qemu-trivial@gnu.org; Fri, 28 Apr 2017 09:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.perevalov@samsung.com>) id 1d45Gz-00005s-R6
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.perevalov@samsung.com>) id 1d45Gw-0004ux-Oh
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:45:21 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60479)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <a.perevalov@samsung.com>)
	id 1d45Gw-0004uQ-IL
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 08:45:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0OP400DM9E3DPA10@mailout2.w1.samsung.com> for
	qemu-trivial@nongnu.org; Fri, 28 Apr 2017 13:45:13 +0100 (BST)
Received: from eusmges5.samsung.com (unknown [203.254.199.245])
	by	eucas1p1.samsung.com (KnoxPortal) with ESMTP
	id	20170428124512eucas1p13709dab9a578f860301b48681078ec65~5kGR9MDbM2897028970eucas1p1L;
	Fri, 28 Apr 2017 12:45:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206])
	by	eusmges5.samsung.com (EUCPMTA) with SMTP id C6.F9.25577.85933095;
	Fri, 28	Apr 2017 13:45:12 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180])
	by	eucas1p2.samsung.com (KnoxPortal) with ESMTP
	id	20170428124512eucas1p27f0e5eac48a63a11fb82fd4e6128a839~5kGRTns_u0482804828eucas1p2q;
	Fri, 28 Apr 2017 12:45:12 +0000 (GMT)
X-AuditID: cbfec7f5-f792f6d0000063e9-f7-59033958d3c9
Received: from eusync4.samsung.com ( [203.254.199.214])
	by	eusmgms2.samsung.com (EUCPMTA) with SMTP id 66.1E.20206.37933095;
	Fri, 28	Apr 2017 13:45:39 +0100 (BST)
Received: from aperevalov-ubuntu.rnd.samsung.ru ([106.109.129.199])
	by	eusync4.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit	(built May 5
	2014)) with ESMTPA id <0OP4004RBE36EMA0@eusync4.samsung.com>;	Fri,
	28 Apr 2017 13:45:11 +0100 (BST)
From: Alexey Perevalov <a.perevalov@samsung.com>
To: qemu-trivial@nongnu.org
Cc: a.perevalov@samsung.com
Date: Fri, 28 Apr 2017 15:44:51 +0300
Message-id: <1493383492-14187-1-git-send-email-a.perevalov@samsung.com>
X-Mailer: git-send-email 1.9.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7djPc7oRlsyRBn/WyFrMvXuexWLtmbms
	DkweT65tZvLo27KKMYApissmJTUnsyy1SN8ugStj2rGlzAXrOSt2f5vD1MA4n72LkZNDQsBE
	4s2Np4wQtpjEhXvr2boYuTiEBJYySuw8cI4NJCEk8JlR4utKJpiGxo3vmCGKljFKnOl4BeV0
	M0n865sONIqDg03AQGLfPVuQBhEBaYljl04zgYSZgeyzb0VBwsIChhIP2paAzWcRUJU4+HUd
	C4jNK+Au8fTyfDaIXXISJ49NZgUZLyGwgE2ipWcdM8gcCQFZiU0HmCFqXCT+feqHekBY4tXx
	LVCPyUhcntzNAtHbzijRvbMTatAEoKOn/4Wqspc4dfMq2GfMAnwSk7ZNh1rAK9HRJgRR4iGx
	/sZXFoiwo8SJTzKQMImVuPN6AfMERukFjAyrGEVSS4tz01OLTfWKE3OLS/PS9ZLzczcxAqPq
	9L/jX3cwLj1mdYhRgINRiYeX4QNjpBBrYllxZe4hRgkOZiUR3s4/TJFCvCmJlVWpRfnxRaU5
	qcWHGKU5WJTEeblOXYsQEkhPLEnNTk0tSC2CyTJxcEo1MLqfSyu7OmPizWk5M/JXnApW2LT7
	bRHnw8mzco33lvpkysd7zi0v/ezVsEpVJ2XGye+3DiZN7k68b6cf+PLyBetzu5rMtN/I/Jjc
	/7PhkbJbFIdNqs+RtzJhMatzTA31TjddS3RnZQ7tOlPPdmfXpllPi72vMZV81FvlnJi/4UHy
	itx6QcUiFiWW4oxEQy3mouJEAFh+ksGmAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBLMWRmVeSWpSXmKPExsVy+t/xa7rFlsyRBh8+81jMvXuexWLtmbms
	DkweT65tZvLo27KKMYApys0mIzUxJbVIITUvOT8lMy/dVik0xE3XQkkhLzE31VYpQtc3JEhJ
	oSwxpxTIMzJAAw7OAe7BSvp2CW4Z044tZS5Yz1mx+9scpgbG+exdjJwcEgImEo0b3zFD2GIS
	F+6tZ+ti5OIQEljCKDHpdDsrhNPLJNE19wxQhoODTcBAYt89W5AGEQFpiWOXTjOBhJmB7LNv
	RUHCwgKGEg/alrCB2CwCqhIHv65jAbF5Bdwlnl6ezwaxS07i5LHJrBMYuRcwMqxiFEktLc5N
	zy020itOzC0uzUvXS87P3cQIDKVtx35u2cHY9S74EKMAB6MSD2/EJ8ZIIdbEsuLK3EOMEhzM
	SiK8nX+YIoV4UxIrq1KL8uOLSnNSiw8xmgItn8gsJZqcDwzzvJJ4QxNDc0tDI2MLC3MjIyVx
	3qkfroQLCaQnlqRmp6YWpBbB9DFxcEo1MPq0FCyy10ziyrjTNaHj7pfsti1buz+mrf5Z9vPj
	zwfPubiOPup/Z3Ym+NRWJ5d+8T8ucTcPfDJeZPdbz0jdfCvXjcCd+yL3eCWWGv25s7DYJPWw
	59Ur+gJXVH9+2S9weM/CDtFFv6Z5dmtcrHK6K5N3fgZvToir0br991cd2Jer4y3x99qZVZeV
	WIozEg21mIuKEwHdiI8+OwIAAA==
X-MTR: 20000000000000000@CPGS
X-CMS-MailID: 20170428124512eucas1p27f0e5eac48a63a11fb82fd4e6128a839
X-Msg-Generator: CA
X-Sender-IP: 182.198.249.180
X-Local-Sender: =?UTF-8?B?QWxleGV5IFBlcmV2YWxvdhtTUlItVmlydHVhbGl6YXRpb24g?=
	=?UTF-8?B?TGFiG+yCvOyEseyghOyekBtTZW5pb3IgRW5naW5lZXI=?=
X-Global-Sender: =?UTF-8?B?QWxleGV5IFBlcmV2YWxvdhtTUlItVmlydHVhbGl6YXRpb24g?=
	=?UTF-8?B?TGFiG1NhbXN1bmcgRWxlY3Ryb25pY3MbU2VuaW9yIEVuZ2luZWVy?=
X-Sender-Code: =?UTF-8?B?QzEwG0NJU0hRG0MxMEdEMDFHRDAxMDE1NA==?=
CMS-TYPE: 201P
X-HopCount: 7
X-CMS-RootMailID: 20170428124512eucas1p27f0e5eac48a63a11fb82fd4e6128a839
X-RootMTR: 20170428124512eucas1p27f0e5eac48a63a11fb82fd4e6128a839
References: <CGME20170428124512eucas1p27f0e5eac48a63a11fb82fd4e6128a839@eucas1p2.samsung.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.12
X-Mailman-Approved-At: Fri, 28 Apr 2017 09:41:48 -0400
Subject: [Qemu-trivial] [PATCH V1] fix coding style in migration
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
X-List-Received-Date: Fri, 28 Apr 2017 12:45:22 -0000

Hello, this is a trivial patch which fixes coding style issues.
But it fixes not all coding style issues. Following issues were omitted:
    - ERROR: __func__ should be used instead of gcc specific __FUNCTION__
in migration/block.c
    - ERROR: consider using qemu_strtol in preference to strtol
This was not included, due to I tried to not change logic. Maybe it will be in
the next patch.
    - WARNING: architecture specific defines should be avoided
I found a lot of #ifdef __linux__, as I assume checkpatch script expects
linux specific code in separate file_linux.c and separation in Makefiles.
    - ERROR: spaces required around that '*'
Looks like it's false positive in 
#362: FILE: savevm.c:362:
+    .subsections = (const VMStateDescription*[]) {


Alexey Perevalov (1):
  migration: Fixed code style

 migration/exec.c         |  3 ++-
 migration/migration.c    |  6 +++---
 migration/postcopy-ram.c |  2 +-
 migration/ram.c          | 13 ++++++++-----
 migration/rdma.c         | 23 ++++++++++++++---------
 migration/savevm.c       |  9 ++++++---
 migration/vmstate.c      | 10 +++++-----
 7 files changed, 39 insertions(+), 27 deletions(-)

-- 
1.9.1


