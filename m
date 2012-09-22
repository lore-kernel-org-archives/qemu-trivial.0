Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFUpM-0003Uh-KX
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 14:53:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFUpJ-0003KM-1I
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:53:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFUpH-0008A0-Vi
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:53:16 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TFUpF-00089W-IL; Sat, 22 Sep 2012 14:53:13 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D22B27280033; Sat, 22 Sep 2012 20:53:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 0OVezdNCIYmn; Sat, 22 Sep 2012 20:53:11 +0200 (CEST)
Received: from [192.168.178.20] (p54ADAD92.dip.t-dialin.net [84.173.173.146])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	2FEBF7280032; Sat, 22 Sep 2012 20:53:11 +0200 (CEST)
Message-ID: <505E0916.6030707@weilnetz.de>
Date: Sat, 22 Sep 2012 20:53:10 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
	<20120922162920.GB14154@stefanha-thinkpad.localdomain>
In-Reply-To: <20120922162920.GB14154@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pflash: Avoid warnings from coverity
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
X-List-Received-Date: Sat, 22 Sep 2012 18:53:19 -0000

Am 22.09.2012 18:29, schrieb Stefan Hajnoczi:
> On Wed, Sep 19, 2012 at 06:41:14PM +0200, Stefan Weil wrote:
[snip]
>>           offset_end = (offset_end + 511) >> 9;
>> -        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>> -                   offset_end - offset);
>> +        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>> +                       offset_end - offset) == -1) {
> bdrv_write() returns -errno, not -1.

Thanks. It looks like we have more code which uses the wrong check
(and which I copied). So more patches are needed.

Should we also replace code which does bdrv_write() != 0 or !bdrv_write()
by bdrv_write() < 0 to get more uniform code (and the same for bdrv_read*),
even it is not strictly wrong?

Maybe Kevin as block maintainer should decide that.

>> +            fprintf(stderr, "pflash: Error writing to flash storage\n");
>> +        }
> Please report the errno and possibly bdrv_get_device_name() to uniquely
> identify this block device.

That would be overkill here: writing flash memory is not used very
often (even on real hardware it is typically only used for firmware
updates). I expect that anyone who does a firmware update in a
QEMU guest will know the name of the flash image file.

Usually I replace the flash image file on the QEMU host when I want
to exchange the firmware (much easier than flashing in the guest).

Reporting errno might be more reasonable.Are there other values than
EIO (e.g. defective media) and ENOSPC (disk full) which could occur?

A common solution for all users of bdrv_write in the block layer
would be even better. VirtualBox for example stops the guest when
ENOSPC (disk full) occurs, so it's possible for users to fix that
and resume the emulation.

> Peter's comments about reporting errors to the guest make sense to me.
> I'm not sure how much work that involves, printing the error is a step
> in the right direction but we shouldn't forget the TODO.
>
> Stefan

There is no 1:1 mapping of block write errors on the host to
an error statusin the flash controller.

Currently the code in pflash_cfi01.c sets an error status which
can be (mis-)used for block write errors. I just prepared a
patch which does this.

In pflash_cfi02.c I did not see such error status handling,
therefore I'd stick to printing an error message there.

Regards

Stefan W.


