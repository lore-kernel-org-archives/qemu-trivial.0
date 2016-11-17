Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c7HUq-0000b8-Bk
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2016 02:52:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c7HUo-0000b1-3x
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 02:52:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c7HUk-0002MA-OO
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 02:52:34 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:52006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1c7HUk-0002Lq-Dz; Thu, 17 Nov 2016 02:52:30 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LkggW-1cfWJP1TL2-00aSeB; Thu, 17 Nov 2016 08:52:15 +0100
To: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
	Stefan Hajnoczi <stefanha@gmail.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
	<0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
	<582D576B.7000804@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com,
	dgilbert@redhat.com, Amit Shah <amit.shah@redhat.com>,
	Eric Blake <eblake@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <000ec561-21b1-46b8-3951-6de680fda41b@vivier.eu>
Date: Thu, 17 Nov 2016 08:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <582D576B.7000804@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:ZPUHfjUzLAHPdIEK5LNN+FECK7T7OZBhG0ZkyGoaChJsrnsgl8U
	k9Qwk384BbSBiUmrZkhQlUCkBswenpHwPUQpjh63wksFzqKANN++dMi+K16euArGEOZOt10
	NEKsTQkRJuXpc9RWdGtg4iy6NKMjSKInI8weY/E68KHNOr6dAFBZSc4rsreCONMDZLznY/A
	HA9fmrdywuvHX/AcUkvJw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:CO262demqAY=:oG9FUm46Nw7MTOkh0tss0+
	jhDSeTAEIZxIp7cPgZ59FAS8sDHOHHcoj8cXQ4eH4XBDssys7/gU0DVw9HjZWENDtapNexCNg
	2uOCmGOMF1AQPgb0wiylXLkpQvswQv8Yg+Mfvsl9sypqZgCk6k5kU7wbG4gujoj5yiDBaVDyI
	4mXEUCzwrLSVrN3DQ2Qy6FbYMLF8ukNOru5Yo6biFdD2SamMetHPan4Cq807yDwPnt8yjM+OU
	2GznAWmNUaWWzZlHTEXiLfnBTGfgeJgN0ROaA62c5kAm3QBAxgQT1+5pPL0Mnhm4cy+IeQuxN
	rSn3lz0rHEkMBnlnde+awZwrjLqmPkSbhcBKJDMMu+2NFLU9dcxYYvT/6g4zxHIJgSGgJto4+
	bNNDcqgsrdRukU4AoJaRpedzyS2S3fBaHIWAQ/OPoy+9LgaEkXDekpZ7ZsmSUMBUWsc5C9JQI
	/c3gGu9mUVAxHyu0TrSYbbJY9omVt2OfFeEiuWH0TSR6WiL5O9src4eR2XHjIqsaTElHDSpHW
	kE6p4UiQzpMkbnBT/nzz4lji77QUYA3BOCDjTzLRcWm224HOu6DEIRtw5zot5V0TYEohplMLt
	cRtDAt39kPuu8eH9jTi1/8kuJYUG9cImTKk5jfIzMMv1pdmOAukoSWEtRFq0irgA6lNpX/8YD
	+duZqC6fufDVepMnnmNNsAAWFbi8DWsfBB9ntjzClHORResRZuBP8YFi1RQ3PMFE/wqyZUeyC
	hCBPCeQ0Mww6Aw4T
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi-schema: clarify
 'colo' state for MigrationStatus
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
X-List-Received-Date: Thu, 17 Nov 2016 07:52:35 -0000

Le 17/11/2016 à 08:08, Hailiang Zhang a écrit :
> Hi Laurent,
> 
> On 2016/11/15 16:44, Laurent Vivier wrote:
>> Le 14/11/2016 à 14:54, Stefan Hajnoczi a écrit :
>>> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>>>> ping ?
>>>>
>>>> Anyone pick this up?
>>>
>>> The original patch that added these lines went through Amit Shah and
>>> David Gilbert.  I have CCed them.
>>
>> If it is needed, I can also send a pull request through my
>> trivial-patches branch.
>>
> 
> I think this patch can go through your trivial branch if Amit or Dave
> didn't pick it up.

Stefan,

can I send a pull request for this while we are in hard freeze phase or
should we wait the end of the release?

Thanks,
Laurent


