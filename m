Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SiETo-0001n7-5e
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 20:45:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SiETl-0001jl-M1
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 20:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SiETi-0001uQ-Rf
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 20:45:33 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:35142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SiETi-0001uE-Kz
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 20:45:30 -0400
Received: by bkwj10 with SMTP id j10so2189327bkw.4
	for <qemu-trivial@nongnu.org>; Fri, 22 Jun 2012 17:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=T/vCxNuJhxBIS9lIgIfYConRtNKqib1hA1Whj1mASko=;
	b=ADntlGlnZZ9kduZXWusxG5xdmeTcKQw7YoiqQHt6KjxhnSDVD0Am30ARwFTtgcGUPI
	Xls5AlskDYijhWUPPmciHTFVBrrYEixYo2hCKRwmP00nVPsiyA6mhvmFqGvFF36m+0RS
	4L/AB8WfcEz1lHyNYAp9RboNsxlt1TeUWQKfUmKgVvQh1nTlwOiRaXlnVWal1VqCFmJD
	rcYf0zU9wTVPPI9xXYhk+Hx/Zuff62BUI32HsuwmArMi5ahRNFJngP8DmyVVpemRzHeK
	iu4mg8rI5QW5uqHm8fwXoHPCvmGGLGksFEL82sfutkqLNoLwsmsEMyH0osC9yb0p9zG5
	qAUw==
MIME-Version: 1.0
Received: by 10.205.128.8 with SMTP id hc8mr1447024bkc.17.1340412327741; Fri,
	22 Jun 2012 17:45:27 -0700 (PDT)
Received: by 10.204.119.199 with HTTP; Fri, 22 Jun 2012 17:45:27 -0700 (PDT)
In-Reply-To: <758530A9-E76E-4B60-A40B-E7807EB139ED@suse.de>
References: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
	<CAEgOgz4ftvGuqoDP6GK+oX7AVKwxxLOqfVEmGa1nm1=7LJpKOw@mail.gmail.com>
	<758530A9-E76E-4B60-A40B-E7807EB139ED@suse.de>
Date: Sat, 23 Jun 2012 10:45:27 +1000
Message-ID: <CAEgOgz4Ko8-uT8Cyhe1m06REqqT3DbWBGDrFZoajJ++R4OOnzA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQmH3LbLkgaHreg/Lr7yAjeNpygR42PAZ21Yh7nxuRGAxS1CAIbBhVw7IYjkywE1z9zpFOnT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: jyoung5@us.ibm.com, hollisb@us.ibm.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, edgar.iglesias@gmail.com,
	john.williams@petalogix.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] device_tree:
 load_device_tree(): Allow NULL sizep
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
X-List-Received-Date: Sat, 23 Jun 2012 00:45:35 -0000

On Sat, Jun 23, 2012 at 7:14 AM, Alexander Graf <agraf@suse.de> wrote:
>
> On 22.06.2012, at 15:17, Peter Crosthwaite wrote:
>
>> CC device-tree.c original contributors. (Jerome Young and Hollis Blanchard).
>>
>> I cant find a maintainer for device-tree, and Stefan wants a review.
>> This patch seem ok?
>
> Hrm, guess I should file a patch to declare myself maintainer for the time being, unless someone else wants to stand up and take on it.

I'm happy to do it as well.

>
> Acked-by: Alexander Graf <agraf@suse.de>
>

Thanks.

Regards,
Peter
>
> Alex
>

