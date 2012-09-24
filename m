Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TG4Q9-0007YU-EJ
	for mharc-qemu-trivial@gnu.org; Mon, 24 Sep 2012 04:53:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TG4Q1-0007MV-F4
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 04:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TG4Pw-0001p0-49
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 04:53:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TG4Pv-0001om-Sj; Mon, 24 Sep 2012 04:53:28 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8O8rPQu017562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Sep 2012 04:53:26 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q8O8rN3u005545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 04:53:24 -0400
Message-ID: <50601F84.8020705@redhat.com>
Date: Mon, 24 Sep 2012 10:53:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
	<20120922162920.GB14154@stefanha-thinkpad.localdomain>
	<505E0916.6030707@weilnetz.de> <50601043.2080209@redhat.com>
	<878vbzvmmn.fsf@blackfin.pond.sub.org>
In-Reply-To: <878vbzvmmn.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pflash: Avoid warnings from
 coverity
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
X-List-Received-Date: Mon, 24 Sep 2012 08:53:39 -0000

Am 24.09.2012 10:41, schrieb Markus Armbruster:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
>> Am 22.09.2012 20:53, schrieb Stefan Weil:
>>> Am 22.09.2012 18:29, schrieb Stefan Hajnoczi:
>>>> On Wed, Sep 19, 2012 at 06:41:14PM +0200, Stefan Weil wrote:
>>> [snip]
>>>>>           offset_end = (offset_end + 511) >> 9;
>>>>> -        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>>>>> -                   offset_end - offset);
>>>>> +        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>>>>> +                       offset_end - offset) == -1) {
>>>> bdrv_write() returns -errno, not -1.
>>>
>>> Thanks. It looks like we have more code which uses the wrong check
>>> (and which I copied). So more patches are needed.
>>>
>>> Should we also replace code which does bdrv_write() != 0 or !bdrv_write()
>>> by bdrv_write() < 0 to get more uniform code (and the same for bdrv_read*),
>>> even it is not strictly wrong?
>>>
>>> Maybe Kevin as block maintainer should decide that.
>>
>> Yes, I very much prefer ret < 0 checks for all block layer functions.
>>
>>>>> +            fprintf(stderr, "pflash: Error writing to flash storage\n");
>>>>> +        }
>>>> Please report the errno and possibly bdrv_get_device_name() to uniquely
>>>> identify this block device.
>>>
>>> That would be overkill here: writing flash memory is not used very
>>> often (even on real hardware it is typically only used for firmware
>>> updates). I expect that anyone who does a firmware update in a
>>> QEMU guest will know the name of the flash image file.
>>>
>>> Usually I replace the flash image file on the QEMU host when I want
>>> to exchange the firmware (much easier than flashing in the guest).
>>>
>>> Reporting errno might be more reasonable.Are there other values than
>>> EIO (e.g. defective media) and ENOSPC (disk full) which could occur?
>>
>> Basically anything that the OS can return. The block layer may
>> internally generate things like -EACCES for writing to read-only images,
>> or -ENOMEDIUM (not sure if it's possible for pflash).
>>
>>> A common solution for all users of bdrv_write in the block layer
>>> would be even better. VirtualBox for example stops the guest when
>>> ENOSPC (disk full) occurs, so it's possible for users to fix that
>>> and resume the emulation.
>>
>> virtio-blk/IDE/scsi-disk do that.
> 
> Doing it in the block layer for all devices would be cleaner
> conceptually.  If I remember correctly, we did it in devices instead,
> because that was much simpler.

I believe today it wouldn't be too hard to implement the request
queueing in the block layer. However, we can't change it without
breaking migration, we'd need a VMState for the block layer.

Kevin

