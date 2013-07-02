Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uu7LP-0008KT-29
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jul 2013 16:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Uu7LM-0008Gf-LF
	for qemu-trivial@nongnu.org; Tue, 02 Jul 2013 16:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Uu7LL-0002HU-FS
	for qemu-trivial@nongnu.org; Tue, 02 Jul 2013 16:38:32 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Uu7LI-0002Gh-9r; Tue, 02 Jul 2013 16:38:28 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6822A7281989; Tue,  2 Jul 2013 22:38:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id h0EDjTHKtxrn; Tue,  2 Jul 2013 22:38:25 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBB03.dip0.t-ipconnect.de [84.173.187.3])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3227F7280102; Tue,  2 Jul 2013 22:38:25 +0200 (CEST)
Message-ID: <51D33A40.3070903@weilnetz.de>
Date: Tue, 02 Jul 2013 22:38:24 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1371382385-20415-1-git-send-email-sw@weilnetz.de>
	<51D33918.3030108@weilnetz.de>
In-Reply-To: <51D33918.3030108@weilnetz.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] savevm: Fix potential
	memory leak
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
X-List-Received-Date: Tue, 02 Jul 2013 20:38:33 -0000

Am 02.07.2013 22:33, schrieb Stefan Weil:
> Am 16.06.2013 13:33, schrieb Stefan Weil:
>> The leak was reported by cppcheck. Fix it by moving the g_malloc0 after
>> the argument validity check.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  savevm.c |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/savevm.c b/savevm.c
>> index 2ce439f..b883714 100644
>> --- a/savevm.c
>> +++ b/savevm.c
>> @@ -479,7 +479,7 @@ static const QEMUFileOps socket_write_ops = {
>>  
>>  QEMUFile *qemu_fopen_socket(int fd, const char *mode)
>>  {
>> -    QEMUFileSocket *s = g_malloc0(sizeof(QEMUFileSocket));
>> +    QEMUFileSocket *s;
>>  
>>      if (mode == NULL ||
>>          (mode[0] != 'r' && mode[0] != 'w') ||
>> @@ -488,6 +488,7 @@ QEMUFile *qemu_fopen_socket(int fd, const char *mode)
>>          return NULL;
>>      }
>>  
>> +    s = g_malloc0(sizeof(QEMUFileSocket));
>>      s->fd = fd;
>>      if (mode[0] == 'w') {
>>          qemu_set_block(s->fd);
>
> Ping?


Sorry, that was bad bookkeeping on my side.
The patch was already applied.

Stefan


