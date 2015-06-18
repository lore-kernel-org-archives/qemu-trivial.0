Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5aSI-0001K7-7F
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 10:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5aSB-0001AH-PF
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 10:06:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5aS7-0008G2-02
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 10:06:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z5aRy-0008Ce-6F; Thu, 18 Jun 2015 10:05:50 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1A9842D44EA;
	Thu, 18 Jun 2015 14:05:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5IE5lnm021040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Jun 2015 10:05:48 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 68F57303F904; Thu, 18 Jun 2015 16:05:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
	<87twu5z7px.fsf@blackfin.pond.sub.org>
	<CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>
Date: Thu, 18 Jun 2015 16:05:46 +0200
In-Reply-To: <CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>
	(Peter Maydell's message of "Thu, 18 Jun 2015 13:47:05 +0100")
Message-ID: <87twu5nmbp.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add .dir-locals.el file
	to configure emacs coding style
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
X-List-Received-Date: Thu, 18 Jun 2015 14:06:08 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 18 June 2015 at 10:28, Markus Armbruster <armbru@redhat.com> wrote:
>> However, I can't see how I could define a new C style there without
>> pushing the "local variables" feature well beyond its intended use, and
>> triggering the confirmation prompts.
>
> We wouldn't want to define a new C style, but in general the items
> I have in my config over the Stroustrup defaults are going to be there
> because I've noticed something where Stroustrup doesn't indent right...

As far as I can see, the difference bwteen stroustrup style and yours is
a few tweaks to c-offsets-alist and c-hanging-braces-alist.  I'm not
sure how to do that from .dir-locals.el.

>> If we take Dan's patch, every Emacs user who hasn't already configured a
>> suitable style profits.  Users who have may have to adjust their
>> configuration to work with or around Dan's patch.
>
> Is there some way to tell whether your emacs has picked up the local
> style info rather than the one you have in your .emacs ?

The obvious way is to check the buffer-local variables.  Buffer-local
variable c-indentation-style is the name of the style in use.  Without
anything in .emacs or local variables, it's "gnu".  With your
(c-add-style "qemu" qemu-c-style) in .emacs, it should be "qemu".  With
Dan's .dir-locals.el, it should be "stroustrup".

When you can't or don't want to create or modify a .dir-locals.el, you
can do something like this instead:

    (dir-locals-set-class-variables 'qemu '((c-mode . ((c-file-style . "qemu")))))
    (dir-locals-set-directory-class "~/work/qemu" 'qemu)

This *overrides* .dir-locals.el in my testing.

