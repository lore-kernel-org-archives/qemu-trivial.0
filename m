Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWhNn-0003xD-0D
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 03:53:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XWhNh-0003oR-JU
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 03:53:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XWhNd-0004O7-51
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 03:52:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XWhNT-0004M7-Sp; Wed, 24 Sep 2014 03:52:44 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 38DED46497;
	Wed, 24 Sep 2014 11:52:37 +0400 (MSK)
Message-ID: <54227845.6090508@msgid.tls.msk.ru>
Date: Wed, 24 Sep 2014 11:52:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Zifei Tong <zifeitong@gmail.com>, qemu-devel@nongnu.org
References: <1410092666-17405-1-git-send-email-zifeitong@gmail.com>
	<CAJ7wx-FqAPy85ROq3cprYmA39X--z83jBaLhhpwocXRHHnqc8w@mail.gmail.com>
In-Reply-To: <CAJ7wx-FqAPy85ROq3cprYmA39X--z83jBaLhhpwocXRHHnqc8w@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>,
	Anthony Liguori <aliguori@amazon.com>, Kirill Batuzov <batuzovk@ispras.ru>
Subject: Re: [Qemu-trivial] [PATCH] qemu-char: Do not disconnect when
 there's data for reading
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
X-List-Received-Date: Wed, 24 Sep 2014 07:53:02 -0000

16.09.2014 09:31, Zifei Tong wrote:
> Friendly ping.
> 
> Also CC to qemu-trivial.

There was at least 2 subsequent versions of this down the line,
a v2 and a v3.  (Just to show why I haven't applied it to -trivial).

Thanks,

/mjt

> On Sun, Sep 7, 2014 at 8:24 PM, Zifei Tong <zifeitong@gmail.com> wrote:
>> After commit 812c1057f6175ac9a9829fa2920a2b5783814193 (Handle G_IO_HUP
>> in tcp_chr_read for tcp chardev), the connection is disconnected when in
>> G_IO_HUP condition.
>>
>> However, it's possible that the channel is in G_IO_IN condition at the
>> same time, meaning there is data for reading. In that case, the
>> remaining data is not handled.
>>
>> I saw a related bug when running socat in write-only mode, with
>>
>>   $ echo "quit" | socat -u - UNIX-CONNECT:qemu-monitor
>>
>> the monitor won't not run the 'quit' command.
>>
>> CC: Kirill Batuzov <batuzovk@ispras.ru>
>> CC: Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>
>> CC: Anthony Liguori <aliguori@amazon.com>
>> Signed-off-by: Zifei Tong <zifeitong@gmail.com>
>> ---
>>  qemu-char.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-char.c b/qemu-char.c
>> index 1a8d9aa..5018c3a 100644
>> --- a/qemu-char.c
>> +++ b/qemu-char.c
>> @@ -2706,7 +2706,7 @@ static gboolean tcp_chr_read(GIOChannel *chan, GIOCondition cond, void *opaque)
>>      uint8_t buf[READ_BUF_LEN];
>>      int len, size;
>>
>> -    if (cond & G_IO_HUP) {
>> +    if (!(cond & G_IO_IN) && (cond & G_IO_HUP)) {
>>          /* connection closed */
>>          tcp_chr_disconnect(chr);
>>          return TRUE;
>> --
>> 2.1.0
>>
> 


