Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XuGyE-00075N-6y
	for mharc-qemu-trivial@gnu.org; Fri, 28 Nov 2014 03:32:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XuGy4-0006vJ-W3
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 03:32:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XuGxz-0004Yg-JE
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 03:31:56 -0500
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235]:36532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XuGxo-0004Um-0X; Fri, 28 Nov 2014 03:31:40 -0500
Received: by mail-wg0-f53.google.com with SMTP id l18so8256169wgh.12
	for <multiple recipients>; Fri, 28 Nov 2014 00:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=TTx04Wb/KL1ER1+BM+XVsS3djiojy3bR5yOSyT0FxK8=;
	b=zjFOGUGun7jaxpBbQCcJnHE7lgWcAYgApenT4TNuNVCxysz3A7lX3edXcvHOzwrr9g
	6jjrlVXW650cgQwQQqp9OuJ0PVjBT/RpcZI4OJfBPhOmk/SXg2nipMF4aVp7vj4y2TGp
	NEvShTyCY4oRB5s8fwrvnGPlM3HW+JSi9RNpVl2IwKq5aQaHxFkUCFGpFhIBmvoCZP0o
	VQTayWJ8ZuKdRUeB7V2ss3EjFRs15Jbknxf6YSj8hA+ZIYrWTYLhu3w/im+7Ex2CJ0Bj
	5k3BzO6zzkRutEAsWBGL2FSWstXt9GuKgdhicZzZFrzY+qkbk1rHpazzH5GpoPLsDGRt
	PRug==
X-Received: by 10.180.109.46 with SMTP id hp14mr9123183wib.54.1417163499295;
	Fri, 28 Nov 2014 00:31:39 -0800 (PST)
Received: from [192.168.10.150] (net-93-146-133-240.cust.vodafonedsl.it.
	[93.146.133.240])
	by mx.google.com with ESMTPSA id ud1sm14046115wjc.7.2014.11.28.00.31.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Nov 2014 00:31:37 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <547832E7.1090508@redhat.com>
Date: Fri, 28 Nov 2014 09:31:35 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Gonglei <arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<5476FD18.9000403@huawei.com>
In-Reply-To: <5476FD18.9000403@huawei.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::235
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 0/2] virtfs-proxy-helper: Fix Coverity
	warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Nov 2014 08:32:04 -0000



On 27/11/2014 11:29, Gonglei wrote:
> On 2014/11/13 20:17, Gonglei (Arei) wrote:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Gonglei (2):
>>   virtfs-proxy-helper: Fix possible socket leak.
>>   virtfs-proxy-helper: Fix handle leak to make Coverity happy
>>
>>  fsdev/virtfs-proxy-helper.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
> 
> Ping...

Hi Gonglei---thanks, I had missed this and Michael is probably not
sending qemu-trivial patches because we're so close to the release.
I'll pick up patch 1.

Paolo

