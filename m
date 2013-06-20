Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpWg7-0008KZ-Cz
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jun 2013 00:40:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UpWg4-0008GW-IM
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 00:40:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UpWg2-0001qd-RR
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 00:40:56 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:43684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UpWfz-0001pw-SQ; Thu, 20 Jun 2013 00:40:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 4D09F1588A1;
	Thu, 20 Jun 2013 06:40:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r86.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fxZSrBy7lYYS; Thu, 20 Jun 2013 06:40:54 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB10E.dip0.t-ipconnect.de [84.173.177.14])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 7EF00158899;
	Thu, 20 Jun 2013 06:40:54 +0200 (CEST)
Message-ID: <51C287CF.7030701@weilnetz.de>
Date: Thu, 20 Jun 2013 06:40:47 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1371676109-16313-1-git-send-email-sw@weilnetz.de>
	<44C4E791-957F-4B61-BE3D-DDB1E3F2238D@suse.de>
In-Reply-To: <44C4E791-957F-4B61-BE3D-DDB1E3F2238D@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] pseries: Fix compiler warning
 (conversion of pointer to integral value)
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
X-List-Received-Date: Thu, 20 Jun 2013 04:40:58 -0000

Am 19.06.2013 23:40, schrieb Alexander Graf:
> On 19.06.2013, at 23:08, Stefan Weil wrote:
>
>> This kind of type cast must use uintptr_t or target_ulong to be portable
>> for hosts with sizeof(void *) != sizeof(long).
>>
>> Here the value is assigned to a variable of type target_ulong.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Acked-by: Alexander Graf <agraf@suse.de>
>
> I suppose this one goes through the trivial tree?
>
>
> Alex

If Michael pulls it to qemu-trivial, that's fine for me
(that's why I addressed my mail To: qemu-devel).

Of course I would not mind if someone with commit
rights commits it directly without waiting for a pull
request :-) Any patch with "Fix" in the subject is a
candidate for a direct commit.

Stefan


