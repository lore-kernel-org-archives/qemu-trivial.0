Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUPvP-0004Ni-B2
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 22:59:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bUPvN-0004Mg-Hk
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 22:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bUPvM-0005Vu-KK
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 22:59:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1bUPvH-0005Ut-6G; Mon, 01 Aug 2016 22:59:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F0C83DE40;
	Tue,  2 Aug 2016 02:59:14 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-63-192.rdu2.redhat.com
	[10.10.63.192])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u722xC93006092; Mon, 1 Aug 2016 22:59:13 -0400
To: Fam Zheng <famz@redhat.com>
References: <1470027888-24381-1-git-send-email-famz@redhat.com>
	<abd48ab4-4fd2-9e5e-c680-cbac5396f594@redhat.com>
	<20160802010906.GA680@ad.usersys.redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <54132026-6fad-5201-a793-4c312dce9c65@redhat.com>
Date: Mon, 1 Aug 2016 22:59:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160802010906.GA680@ad.usersys.redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 02 Aug 2016 02:59:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] curl: Cast fd to int for
 DPRINTF
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
X-List-Received-Date: Tue, 02 Aug 2016 02:59:22 -0000



On 08/01/2016 09:09 PM, Fam Zheng wrote:
> On Mon, 08/01 12:41, John Snow wrote:
>>> -    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
>>> +    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, (int)fd);
>>>      switch (action) {
>>>          case CURL_POLL_IN:
>>>              aio_set_fd_handler(s->aio_context, fd, false,
>>>
>>
>> Is curl_socket_t always of type long long unsigned int? why not use %llu ?
>
> Since it is a typedef, variation between platforms is imaginable. On Linux it
> is 4 bytes, the error is only seen on Windows.
>
> Fam
>

Ah, there we go. The B-O-D was justified. :)

