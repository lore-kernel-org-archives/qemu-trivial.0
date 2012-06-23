Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SiN9f-0007Gp-GK
	for mharc-qemu-trivial@gnu.org; Sat, 23 Jun 2012 06:01:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1SiN9b-00075S-Uc
	for qemu-trivial@nongnu.org; Sat, 23 Jun 2012 06:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1SiN9a-0001gx-AB
	for qemu-trivial@nongnu.org; Sat, 23 Jun 2012 06:01:19 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41713 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1SiN9X-0001gS-2s; Sat, 23 Jun 2012 06:01:15 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 625D7A30EC;
	Sat, 23 Jun 2012 12:01:10 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=iso-8859-1
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <CAEgOgz4Ko8-uT8Cyhe1m06REqqT3DbWBGDrFZoajJ++R4OOnzA@mail.gmail.com>
Date: Sat, 23 Jun 2012 12:01:04 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <7852CE64-7652-4414-B2F1-8E0EFB6B7D4B@suse.de>
References: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
	<CAEgOgz4ftvGuqoDP6GK+oX7AVKwxxLOqfVEmGa1nm1=7LJpKOw@mail.gmail.com>
	<758530A9-E76E-4B60-A40B-E7807EB139ED@suse.de>
	<CAEgOgz4Ko8-uT8Cyhe1m06REqqT3DbWBGDrFZoajJ++R4OOnzA@mail.gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
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
X-List-Received-Date: Sat, 23 Jun 2012 10:01:21 -0000


On 23.06.2012, at 02:45, Peter Crosthwaite wrote:

> On Sat, Jun 23, 2012 at 7:14 AM, Alexander Graf <agraf@suse.de> wrote:
>>=20
>> On 22.06.2012, at 15:17, Peter Crosthwaite wrote:
>>=20
>>> CC device-tree.c original contributors. (Jerome Young and Hollis =
Blanchard).
>>>=20
>>> I cant find a maintainer for device-tree, and Stefan wants a review.
>>> This patch seem ok?
>>=20
>> Hrm, guess I should file a patch to declare myself maintainer for the =
time being, unless someone else wants to stand up and take on it.
>=20
> I'm happy to do it as well.

Works fine for me :). Just send a patch to MAINTAINERS. If you like, add =
me to it as well as your backup, though you probably know more about dt =
than me ;).


Alex


