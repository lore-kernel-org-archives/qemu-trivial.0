Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TG3PE-00039M-66
	for mharc-qemu-trivial@gnu.org; Mon, 24 Sep 2012 03:48:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TG3P6-0002kC-Hz
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 03:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TG3P0-0004s2-OP
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 03:48:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TG3Ox-0004rf-PY; Mon, 24 Sep 2012 03:48:23 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8O7mLaV003326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Sep 2012 03:48:21 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8O7mIGD019440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 03:48:20 -0400
Message-ID: <50601043.2080209@redhat.com>
Date: Mon, 24 Sep 2012 09:48:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
	<20120922162920.GB14154@stefanha-thinkpad.localdomain>
	<505E0916.6030707@weilnetz.de>
In-Reply-To: <505E0916.6030707@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 24 Sep 2012 07:48:39 -0000

Am 22.09.2012 20:53, schrieb Stefan Weil:
> Am 22.09.2012 18:29, schrieb Stefan Hajnoczi:
>> On Wed, Sep 19, 2012 at 06:41:14PM +0200, Stefan Weil wrote:
> [snip]
>>>           offset_end = (offset_end + 511) >> 9;
>>> -        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>>> -                   offset_end - offset);
>>> +        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>>> +                       offset_end - offset) == -1) {
>> bdrv_write() returns -errno, not -1.
> 
> Thanks. It looks like we have more code which uses the wrong check
> (and which I copied). So more patches are needed.
> 
> Should we also replace code which does bdrv_write() != 0 or !bdrv_write()
> by bdrv_write() < 0 to get more uniform code (and the same for bdrv_read*),
> even it is not strictly wrong?
> 
> Maybe Kevin as block maintainer should decide that.

Yes, I very much prefer ret < 0 checks for all block layer functions.

>>> +            fprintf(stderr, "pflash: Error writing to flash storage\n");
>>> +        }
>> Please report the errno and possibly bdrv_get_device_name() to uniquely
>> identify this block device.
> 
> That would be overkill here: writing flash memory is not used very
> often (even on real hardware it is typically only used for firmware
> updates). I expect that anyone who does a firmware update in a
> QEMU guest will know the name of the flash image file.
> 
> Usually I replace the flash image file on the QEMU host when I want
> to exchange the firmware (much easier than flashing in the guest).
> 
> Reporting errno might be more reasonable.Are there other values than
> EIO (e.g. defective media) and ENOSPC (disk full) which could occur?

Basically anything that the OS can return. The block layer may
internally generate things like -EACCES for writing to read-only images,
or -ENOMEDIUM (not sure if it's possible for pflash).

> A common solution for all users of bdrv_write in the block layer
> would be even better. VirtualBox for example stops the guest when
> ENOSPC (disk full) occurs, so it's possible for users to fix that
> and resume the emulation.

virtio-blk/IDE/scsi-disk do that.

>> Peter's comments about reporting errors to the guest make sense to me.
>> I'm not sure how much work that involves, printing the error is a step
>> in the right direction but we shouldn't forget the TODO.

Shouldn't we avoid fprintfs that can be triggered by the guest?

Kevin

