Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOT3P-0005Go-Mp
	for mharc-qemu-trivial@gnu.org; Mon, 11 Dec 2017 13:43:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <george.kennedy@oracle.com>) id 1eORbI-00059z-Ps
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 12:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <george.kennedy@oracle.com>) id 1eORbF-0000ts-EO
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 12:10:44 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:49633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <george.kennedy@oracle.com>)
	id 1eORbF-0000tN-5G; Mon, 11 Dec 2017 12:10:41 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.21/8.16.0.21) with SMTP id
	vBBH6wGQ018945; Mon, 11 Dec 2017 17:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type; s=corp-2017-10-26;
	bh=tVeHGCy5OMDAPuJbIWgr61JBjc5paZ+EqkYdplEMVJ0=;
	b=ncGr28J6FBEfqTyr1CGCj+XkpaCfT/t6zfji2vdDGVaWLbBFKJcIEt+nIpRGItjmh3CZ
	dCy79+tEMlZPlwCI9rRUtJyn+DZQV+z36SoBbYFVzjPLAZPEbUTba6YXdeGhpxKdXHEJ
	FhMVypE++qJ97S+X19LLk2Ae+nz+xLyaYVkrUXIJl5550Sqp/kmyn72E3gFQmDNJnxo7
	ZAcbuvsPD6TwHVMs8YhxHYPakuKZwWaFFE4d0LMwDttSa9fy6O9iw+HYI6UlHR/+yoP7
	SMvD1eNb0l+9cuUDM4lLMl4W5ncSXo1iCdPfpk0ndYpcwrlS1WBbxZRFLlYghz9UV24N
	lA== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by aserp2130.oracle.com with ESMTP id 2eswny89j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Dec 2017 17:10:39 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id vBBHAdnt006629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 11 Dec 2017 17:10:39 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id vBBHAcpS030914;
	Mon, 11 Dec 2017 17:10:39 GMT
Received: from [10.152.35.216] (/10.152.35.216)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 11 Dec 2017 09:10:38 -0800
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <a2b410dd-1150-16a4-9376-069117a14c98@oracle.com>
	<5b24ac58-738a-ac39-f4ed-6cffb3727a26@oracle.com>
	<bd3649e6-0268-7329-0574-0767fe04b3c9@redhat.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
Message-ID: <35a0dce9-896a-300c-ae39-bb89f6d7d374@oracle.com>
Date: Mon, 11 Dec 2017 12:11:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <bd3649e6-0268-7329-0574-0767fe04b3c9@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------B8BDAC2C65055A5961B57B77"
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8742
	signatures=668644
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1712110253
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.79
X-Mailman-Approved-At: Mon, 11 Dec 2017 13:43:50 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] lsi_scsi: add support for
 PPR Extended Message
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
X-List-Received-Date: Mon, 11 Dec 2017 17:10:46 -0000

This is a multi-part message in MIME format.
--------------B8BDAC2C65055A5961B57B77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by aserp2130.oracle.com id vBBH6wGQ018945

VGhhbmsgeW91IFBhb2xvLA0KDQoiU2lnbmVkLW9mZi1ieTogR2VvcmdlIEtlbm5lZHk8Z2Vv
cmdlLmtlbm5lZHlAb3JhY2xlLmNvbT4iDQoNCkdlb3JnZQ0KDQpPbiAxMi8xMS8yMDE3IDEx
OjU1IEFNLCBQYW9sbyBCb256aW5pIHdyb3RlOg0KPiBPbiAxMS8xMi8yMDE3IDE3OjQ1LCBH
ZW9yZ2UgS2VubmVkeSB3cm90ZToNCj4+IFRoZSBMU0kgNTNjODk1YSBjb2RlIGRvZXMgbm90
IGhhbmRsZSB0aGUgUFBSIEV4dGVuZGVkIE1lc3NhZ2UuIEFkZA0KPj4gc3VwcG9ydCB0byBo
YW5kbGUgUFBSIEV4dGVuZGVkIE1lc3NhZ2UgbGlrZSBTRFRSIGFuZCBXRFRSIGFyZSBoYW5k
bGVkLg0KPj4gVGhhdCBpcywgdG8gc2tpcCBwYXN0IHRoZSBtZXNzYWdlIGJ5dGVzIGFuZCBp
Z25vcmUgdGhlIG1lc3NhZ2UuDQo+Pg0KPj4gLS0tDQo+PiAgwqBody9zY3NpL2xzaTUzYzg5
NWEuYyB8IDQgKysrKw0KPj4gIMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9ody9zY3NpL2xzaTUzYzg5NWEuYyBiL2h3L3Njc2kvbHNp
NTNjODk1YS5jDQo+PiBpbmRleCA1OTVjMjYwLi4xZTAyYTg5IDEwMDY0NA0KPj4gLS0tIGEv
aHcvc2NzaS9sc2k1M2M4OTVhLmMNCj4+ICsrKyBiL2h3L3Njc2kvbHNpNTNjODk1YS5jDQo+
PiBAQCAtOTYxLDYgKzk2MSwxMCBAQCBzdGF0aWMgdm9pZCBsc2lfZG9fbXNnb3V0KExTSVN0
YXRlICpzKQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERQUklOVEYo
IldEVFIgKGlnbm9yZWQpXG4iKTsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsc2lfc2tpcF9tc2dieXRlcyhzLCAxKTsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2Ug
NDoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFBSSU5URigiUFBSIChp
Z25vcmVkKVxuIik7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxzaV9z
a2lwX21zZ2J5dGVzKHMsIDUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGJhZDsNCj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiBIaSBHZW9yZ2UsDQo+DQo+IGZvciBhIHBhdGNoIHRv
IFFFTVUgdG8gYmUgYWNjZXB0ZWQsIHlvdSBuZWVkIHRvIGNvbmZpcm0gdGhlIG9yaWdpbiBv
Zg0KPiB5b3VyIHBhdGNoIChhY2NvcmRpbmcgdG8gdGhlICJEZXZlbG9wZXIgQ2VydGlmaWNh
dGUgb2YgT3JpZ2luIiwgc2VlDQo+IGh0dHBzOi8vZGV2ZWxvcGVyY2VydGlmaWNhdGUub3Jn
LykuDQo+DQo+IEluIG9yZGVyIHRvIGRvIHRoaXMsIGl0J3MgZW5vdWdoIHRvIHJlcGx5IHRv
IHRoaXMgbWVzc2FnZSB3aXRoDQo+ICJTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgS2VubmVkeSA8
Z2VvcmdlLmtlbm5lZHlAb3JhY2xlLmNvbT4iIGluIHRoZSByZXBseS4NCj4NCj4gVGhhbmtz
LA0KPg0KPiBQYW9sbw0KDQo=
--------------B8BDAC2C65055A5961B57B77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by aserp2130.oracle.com id vBBH6wGQ018945

PGh0bWw+DQogIDxoZWFkPg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCiAgPC9oZWFkPg0KICA8Ym9k
eSB0ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4NCiAgICA8cHJlIHdyYXA9IiI+
VGhhbmsgeW91IFBhb2xvLA0KDQoiU2lnbmVkLW9mZi1ieTogR2VvcmdlIEtlbm5lZHkgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmdlb3JnZS5rZW5u
ZWR5QG9yYWNsZS5jb20iPiZsdDtnZW9yZ2Uua2VubmVkeUBvcmFjbGUuY29tJmd0OzwvYT4i
PC9wcmU+DQogICAgR2VvcmdlPGJyPg0KICAgIDxicj4NCiAgICA8ZGl2IGNsYXNzPSJtb3ot
Y2l0ZS1wcmVmaXgiPk9uIDEyLzExLzIwMTcgMTE6NTUgQU0sIFBhb2xvIEJvbnppbmkNCiAg
ICAgIHdyb3RlOjxicj4NCiAgICA8L2Rpdj4NCiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ig0KICAgICAgY2l0ZT0ibWlkOmJkMzY0OWU2LTAyNjgtNzMyOS0wNTc0LTA3NjdmZTA0YjNj
OUByZWRoYXQuY29tIj4NCiAgICAgIDxwcmUgd3JhcD0iIj5PbiAxMS8xMi8yMDE3IDE3OjQ1
LCBHZW9yZ2UgS2VubmVkeSB3cm90ZToNCjwvcHJlPg0KICAgICAgPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+DQogICAgICAgIDxwcmUgd3JhcD0iIj5UaGUgTFNJIDUzYzg5NWEgY29kZSBk
b2VzIG5vdCBoYW5kbGUgdGhlIFBQUiBFeHRlbmRlZCBNZXNzYWdlLiBBZGQNCnN1cHBvcnQg
dG8gaGFuZGxlIFBQUiBFeHRlbmRlZCBNZXNzYWdlIGxpa2UgU0RUUiBhbmQgV0RUUiBhcmUg
aGFuZGxlZC4NClRoYXQgaXMsIHRvIHNraXAgcGFzdCB0aGUgbWVzc2FnZSBieXRlcyBhbmQg
aWdub3JlIHRoZSBtZXNzYWdlLg0KDQotLS0NCsKgaHcvc2NzaS9sc2k1M2M4OTVhLmMgfCA0
ICsrKysNCsKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0
IGEvaHcvc2NzaS9sc2k1M2M4OTVhLmMgYi9ody9zY3NpL2xzaTUzYzg5NWEuYw0KaW5kZXgg
NTk1YzI2MC4uMWUwMmE4OSAxMDA2NDQNCi0tLSBhL2h3L3Njc2kvbHNpNTNjODk1YS5jDQor
KysgYi9ody9zY3NpL2xzaTUzYzg5NWEuYw0KQEAgLTk2MSw2ICs5NjEsMTAgQEAgc3RhdGlj
IHZvaWQgbHNpX2RvX21zZ291dChMU0lTdGF0ZSAqcykNCsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIERQUklOVEYoIldEVFIgKGlnbm9yZWQpXG4iKTsNCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxzaV9za2lwX21zZ2J5dGVzKHMsIDEpOw0KwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjYXNlIDQ6DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERQUklOVEYo
IlBQUiAoaWdub3JlZClcbiIpOw0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
c2lfc2tpcF9tc2dieXRlcyhzLCA1KTsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoNCsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gYmFkOw0KwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0NCjwvcHJlPg0KICAgICAgPC9ibG9ja3F1b3RlPg0KICAgICAgPHByZSB3cmFw
PSIiPg0KSGkgR2VvcmdlLA0KDQpmb3IgYSBwYXRjaCB0byBRRU1VIHRvIGJlIGFjY2VwdGVk
LCB5b3UgbmVlZCB0byBjb25maXJtIHRoZSBvcmlnaW4gb2YNCnlvdXIgcGF0Y2ggKGFjY29y
ZGluZyB0byB0aGUgIkRldmVsb3BlciBDZXJ0aWZpY2F0ZSBvZiBPcmlnaW4iLCBzZWUNCjxh
IGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZGV2ZWxvcGVy
Y2VydGlmaWNhdGUub3JnLyI+aHR0cHM6Ly9kZXZlbG9wZXJjZXJ0aWZpY2F0ZS5vcmcvPC9h
PikuDQoNCkluIG9yZGVyIHRvIGRvIHRoaXMsIGl0J3MgZW5vdWdoIHRvIHJlcGx5IHRvIHRo
aXMgbWVzc2FnZSB3aXRoDQoiU2lnbmVkLW9mZi1ieTogR2VvcmdlIEtlbm5lZHkgPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmdlb3JnZS5rZW5uZWR5
QG9yYWNsZS5jb20iPiZsdDtnZW9yZ2Uua2VubmVkeUBvcmFjbGUuY29tJmd0OzwvYT4iIGlu
IHRoZSByZXBseS4NCg0KVGhhbmtzLA0KDQpQYW9sbw0KPC9wcmU+DQogICAgPC9ibG9ja3F1
b3RlPg0KICAgIDxicj4NCiAgPC9ib2R5Pg0KPC9odG1sPg0K
--------------B8BDAC2C65055A5961B57B77--

