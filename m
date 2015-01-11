Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAGhz-0002C5-Fd
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jan 2015 06:29:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1YAFVg-0000CA-NH
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 05:12:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1YAFVf-0004t3-OX
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 05:12:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1YAFVZ-0004qy-B0; Sun, 11 Jan 2015 05:12:33 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0BACV5B003677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sun, 11 Jan 2015 05:12:31 -0500
Received: from [10.36.5.16] (vpn1-5-16.ams2.redhat.com [10.36.5.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0BACTW2004164; Sun, 11 Jan 2015 05:12:30 -0500
Message-ID: <54B24C8D.1090907@redhat.com>
Date: Sun, 11 Jan 2015 12:12:29 +0200
From: Marcel Apfelbaum <marcel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1420969037-16603-1-git-send-email-marcel@redhat.com>
	<54B24B12.6020703@weilnetz.de>
In-Reply-To: <54B24B12.6020703@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Sun, 11 Jan 2015 06:29:26 -0500
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: fix some alignment
	issues
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
X-List-Received-Date: Sun, 11 Jan 2015 10:12:41 -0000

On 01/11/2015 12:06 PM, Stefan Weil wrote:
> Am 11.01.2015 um 10:37 schrieb Marcel Apfelbaum:
>> The main's switch had a few cases misaligned.
>>
>> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
>> ---
>>   vl.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> The misalignment was caused by tabs which were used instead of spaces.
>
> A short look on vl.c shows lots of more lines with tabs (also in other switch
> statements), so this patch could be extended to fix more lines.
This is what I saw while fixing other stuff. :)
I'll try to hunt others and send another version.

Thanks,
Marcel

>
> Stefan
>


