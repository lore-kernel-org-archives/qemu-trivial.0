Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zbt09-0002t2-J4
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 12:22:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zbt02-0002g3-RG
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 12:22:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zbszy-0003ds-I0
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 12:22:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zbszr-0003cE-W5; Tue, 15 Sep 2015 12:22:20 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 970B32D8B72;
	Tue, 15 Sep 2015 16:22:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8FGMHgx011551
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 15 Sep 2015 12:22:18 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3134B303F916; Tue, 15 Sep 2015 18:22:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
	<87twu5z7px.fsf@blackfin.pond.sub.org>
	<CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>
	<87twu5nmbp.fsf@blackfin.pond.sub.org> <55DBB3B8.9080807@redhat.com>
	<55F839BC.8060409@redhat.com> <20150915155435.GC23145@redhat.com>
Date: Tue, 15 Sep 2015 18:22:17 +0200
In-Reply-To: <20150915155435.GC23145@redhat.com> (Daniel P. Berrange's message
	of "Tue, 15 Sep 2015 16:54:35 +0100")
Message-ID: <87h9mvac06.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
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
X-List-Received-Date: Tue, 15 Sep 2015 16:22:36 -0000

"Daniel P. Berrange" <berrange@redhat.com> writes:

> On Tue, Sep 15, 2015 at 09:31:08AM -0600, Eric Blake wrote:
>> ping
>> 
>> On 08/24/2015 06:15 PM, John Snow wrote:
>> > 
>> > 
>> > On 06/18/2015 10:05 AM, Markus Armbruster wrote:
>> >> Peter Maydell <peter.maydell@linaro.org> writes:
>> >>
>> >>> On 18 June 2015 at 10:28, Markus Armbruster <armbru@redhat.com> wrote:
>> >>>> However, I can't see how I could define a new C style there without
>> >>>> pushing the "local variables" feature well beyond its intended use, and
>> >>>> triggering the confirmation prompts.
>> >>>
>> >>> We wouldn't want to define a new C style, but in general the items
>> >>> I have in my config over the Stroustrup defaults are going to be there
>> >>> because I've noticed something where Stroustrup doesn't indent right...
>> >>
>> >> As far as I can see, the difference bwteen stroustrup style and yours is
>> >> a few tweaks to c-offsets-alist and c-hanging-braces-alist.  I'm not
>> >> sure how to do that from .dir-locals.el.
>> >>
>> >>>> If we take Dan's patch, every Emacs user who hasn't already configured a
>> >>>> suitable style profits.  Users who have may have to adjust their
>> >>>> configuration to work with or around Dan's patch.
>> >>>
>> >>> Is there some way to tell whether your emacs has picked up the local
>> >>> style info rather than the one you have in your .emacs ?
>> >>
>> >> The obvious way is to check the buffer-local variables.  Buffer-local
>> >> variable c-indentation-style is the name of the style in use.  Without
>> >> anything in .emacs or local variables, it's "gnu".  With your
>> >> (c-add-style "qemu" qemu-c-style) in .emacs, it should be "qemu".  With
>> >> Dan's .dir-locals.el, it should be "stroustrup".
>> >>
>> >> When you can't or don't want to create or modify a .dir-locals.el, you
>> >> can do something like this instead:
>> >>
>> >>     (dir-locals-set-class-variables 'qemu '((c-mode
>> >> . ((c-file-style . "qemu")))))
>> >>     (dir-locals-set-directory-class "~/work/qemu" 'qemu)
>> >>
>> >> This *overrides* .dir-locals.el in my testing.
>> >>
>> > 
>> > ping -- any love for this for 2.5?
>
> So just to re-cap.....
>
> My original proposed .dir-locals.el was pretty short:
>
>   ((c-mode . ((c-file-style . "stroustrup")
>              (indent-tabs-mode . nil))))
>
> IIUC, the quote above says it is possible to override this with more
> developer custom styles if desired, so it shouldn't cause any obvious
> disadvantage / problem to contributors to have this set by default.
>
> I have tried an alternative .dir-locals.el that contains all of
> Peter's rules (from http://wiki.linaro.org/PeterMaydell/QemuEmacsStyle)
> which looks like this:
>
>
>   ;; Based on https://wiki.linaro.org/PeterMaydell/QemuEmacsStyle
>   ;; which aims to apply CODING_STYLE guidelines
>   ((c-mode . (
>       (c-file-style . "stroustrup")
>       (indent-tabs-mode . nil)
>       (tab-width . 8)
>       (c-comment-only-line-offset . 1)
>       (c-hanging-braces-alist . ((substatement-open before after)))
>       (c-offsets-alist . (
>           (statement-block-intro . +)
>           (substatement-open . 0)
>           (label . 0)
>           (statement-cont . +)
>           (innamespace . 0)
>           (inline-open . 0)
>       ))
>       (c-hanging-braces-alist . (
>           (brace-list-open)
>           (brace-list-intro)
>           (brace-list-entry)
>           (brace-list-close)
>           (brace-entry-open)
>           (block-close . c-snug-do-while)
>           ;; structs have hanging braces on open
>           (class-open . (after))
>           ;; ditto if statements
>           (substatement-open . (after))
>           ;; and no auto newline at the end
>           (class-close)
>       ))
>   )))
>
> The main downside/problem I found with having this more comprehensive
> .dir-locals.el file, is that emacs will raise a warning at launch time:
>
> "The local variables list in /home/berrange/src/virt/qemu
>  contains vlaues that may not be safe (*).
>
>  Do you want to apply it? You can type
>   y -- to apply the local variables list.
>   n -- to ignore the local variables list.
>   ! -- to apply the local variables list and permanently
>        mark these values (*) as safe (in the future, they
>        will be set automatically)"
>
> It will ask this every time it launches unless you say "!"
> whereupon it modifies your $HOME/.emacs to disable the warning
>
> Personally I be fine with both the minimal approach or the more
> comprehensive approach of Peter's, but I'd probably tend towards
> the minimal approach to avoid the warnings problem.

Seconded.

The "minimal approach" has been on the list since June, and it has my
R-by.  It's clearly better than nothing.  Let's commit it now.  We can
always improve on it later.

