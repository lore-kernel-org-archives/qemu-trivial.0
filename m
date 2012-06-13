Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SejoT-0002yJ-RN
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2012 05:24:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SejoM-0002aW-H8
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2012 05:24:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SejoG-0001uu-8z
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2012 05:24:22 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:38233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Sejo7-0001t6-2X; Wed, 13 Jun 2012 05:24:07 -0400
Received: by lahc1 with SMTP id c1so287343lah.4
	for <multiple recipients>; Wed, 13 Jun 2012 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=sGa0y0RnyZYl/O9dreKy7StDbAMYY7p2mxCP+JrpCXk=;
	b=VJI6b14vPoq0TJ7XSa3c+8uUTEW66OVWlU+Jz0z/aG46jQA0g2C0vP7SG2UcAk2Fr5
	NfHKZgbN5eT6zWMWJYPlYVG16AvxKgNpX8PKj3FFnIDqL/TPaBNnj6ckWWWGoklX0E33
	6vXCnqdgWEUF3nu04EY454jWEAIoc9r+PF9+ya1bJVc4YMkb+7fAv9QKpXhSc0l/c09I
	zWMtNgzuE/nYXXK9Lx88Ov6oHJ8OBAeH1NH/5C+uTriN9vbdZhCrjGB2i6OIOzxVdGZ7
	wG7UX/qUL6vj9f04Xj5MWsENgolXaWX5UI0oS0ojS/LH1IIkNnlMN2jjbEktARcakTld
	Xvhw==
MIME-Version: 1.0
Received: by 10.152.132.40 with SMTP id or8mr882297lab.24.1339579443828; Wed,
	13 Jun 2012 02:24:03 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Wed, 13 Jun 2012 02:24:03 -0700 (PDT)
In-Reply-To: <20120612141439.GA11828@illuin>
References: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
	<20120612094957.GC29104@stefanha-thinkpad.localdomain>
	<20120612141439.GA11828@illuin>
Date: Wed, 13 Jun 2012 10:24:03 +0100
Message-ID: <CAJSP0QU2Pm2OAA_oU0P2qxx-VJ0eoOC-AngeSRjNRvoPVn_80A@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: Remove
	BUILD_DIR from qapi-dir
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
X-List-Received-Date: Wed, 13 Jun 2012 09:24:28 -0000

On Tue, Jun 12, 2012 at 3:14 PM, Michael Roth <mdroth@linux.vnet.ibm.com> w=
rote:
> On Tue, Jun 12, 2012 at 10:49:57AM +0100, Stefan Hajnoczi wrote:
>> On Sat, Jun 09, 2012 at 09:08:38AM +0200, Stefan Weil wrote:
>> > qapi-dir does not need an absolute path. All other build directories
>> > are relative. When BUILD_DIR is removed, the build output looks better
>> > (no long lines with absolute paths when everything else uses short
>> > lines):
>> >
>> > =A0 GEN =A0 qapi-generated/qga-qapi-types.c
>> > =A0 CC =A0 =A0qapi-generated/qga-qapi-types.o
>> > =A0 GEN =A0 qapi-generated/qga-qapi-visit.c
>> > =A0 CC =A0 =A0qapi-generated/qga-qapi-visit.o
>> > =A0 GEN =A0 qapi-generated/qga-qmp-marshal.c
>> > =A0 CC =A0 =A0qapi-generated/qga-qmp-marshal.o
>> >
>> > Using a relative path also avoids potential problems when BUILD_DIR
>> > includes blanks.
>> >
>> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> > ---
>> > =A0Makefile | =A0 =A02 +-
>> > =A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> I merged this but have CCed Michael Roth to take a look. =A0qemu.git
>> contains an earlier commit to explicitly add $(BUILD_DIR):
>>
>> commit 9b129408589b2ed7bb2cdea03d2aba46a5fd74d4
>> Author: Michael Roth <mdroth@linux.vnet.ibm.com>
>> Date: =A0 Tue Nov 29 16:47:49 2011 -0600
>>
>> =A0 =A0 Makefile: use full path for qapi-generated directory
>>
>> =A0 =A0 Generally $(BUILD_DIR) =3D=3D $(CURDIR), but that isn't necessar=
illy the
>> =A0 =A0 case, so use $(BUILD_DIR)/qapi-generated for generated files to
>> =A0 =A0 avoid potentionally sticking generating files in odd places outs=
ide
>> =A0 =A0 the build's include paths.
>>
>> =A0 =A0 Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
>>
>> Does this rationale still apply? =A0Is it really a good ideal to remove
>> $(BUILD_DIR)?
>
> Here's some context for the patch:
>
> http://lists.gnu.org/archive/html/qemu-devel/2011-11/msg03474.html
>
> Originally a change was made to add a $(SRC_DIR) prefix to fix a build.
> This triggered an unrelated bug, and was not quite correct. I submitted
> a patch to fix the bug it triggered, and then a patch that used
> $(BUILD_DIR) instead.
>
> I'm not sure the latter was ever needed however, it looks like it was
> just the classic issue of someone having a dirty $(SRC_DIR) and
> subsequently switching to out of tree builds. I think the original issue
> was simple a stale qapi-generated/ directory sitting in $(SRC_DIR) that
> was taking precedence over the one being created in $(BUILD_DIR)
>
> So, while having the $(BUILD_DIR) prefix does make the build safer in
> this regard, I think it addresses a use-case that was never supported to
> begin with. So I'd be fine with applying Stefan's patch if it makes
> things cleaner/more consistent with everything else.

Thanks for explaining.  I will include Stefan Weil's patch.

Stefan

