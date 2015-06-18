Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5VJl-0000p3-Kg
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 04:37:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5VJf-0000ah-GF
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 04:36:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5VJd-0007So-L3
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 04:36:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z5VJX-0007QZ-Mu; Thu, 18 Jun 2015 04:36:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 2B255376B7D;
	Thu, 18 Jun 2015 08:36:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5I8ajQq030330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Jun 2015 04:36:46 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 71DBF303F904; Thu, 18 Jun 2015 10:36:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>
	<5581CDB3.2030300@msgid.tls.msk.ru>
Date: Thu, 18 Jun 2015 10:36:44 +0200
In-Reply-To: <5581CDB3.2030300@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Wed, 17 Jun 2015 22:42:43 +0300")
Message-ID: <87k2v14dlv.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
	configure emacs coding style
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
X-List-Received-Date: Thu, 18 Jun 2015 08:36:57 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> So, what is the consensus here?
>
> Everyone who talked wants the emacs mode, but everyone
> offers their own mode.
>
> I'd pick the stroustrup variant suggested by Marcus
> since it is shortest, but while being shortest, it
> is looks a bit "magical".

I don't think it's magical at all.  It uses .dir-locals exactly as
intended.  In fact, it's almost straight from the Emacs manual:

       The '.dir-locals.el' file should hold a specially-constructed list,
    which maps major mode names (symbols) to alists (*note
    (elisp)Association Lists::).  Each alist entry consists of a variable
    name and the directory-local value to assign to that variable, when the
    specified major mode is enabled.  Instead of a mode name, you can
    specify 'nil', which means that the alist applies to any mode; or you
    can specify a subdirectory name (a string), in which case the alist
    applies to all files in that subdirectory.

       Here's an example of a '.dir-locals.el' file:

         ((nil . ((indent-tabs-mode . t)
                  (fill-column . 80)))
          (c-mode . ((c-file-style . "BSD")
                     (subdirs . nil)))
          ("src/imported"
           . ((nil . ((change-log-default-name
                       . "ChangeLog.local"))))))

    This sets 'indent-tabs-mode' and 'fill-column' for any file in the
    directory tree, and the indentation style for any C source file.  The
    special 'subdirs' element is not a variable, but a special keyword which
    indicates that the C mode settings are only to be applied in the current
    directory, not in any subdirectories.  Finally, it specifies a different
    'ChangeLog' file name for any file in the 'src/imported' subdirectory.

The .dir-locals.el snippet I suggested is a straighforward cherry-pick
from the above:

    ((c-mode . ((c-file-style . "stroustrup")
                (indent-tabs-mode . nil))))

Here's one that takes better care of tabs:

    ((nil . ((indent-tabs-mode . nil)))
     (makefile-mode ((indent-tabs-mode . t)))
     (c-mode . ((c-file-style . "stroustrup"))))

>                            On the other hand, variant
> from Peter Maydell (https://wiki.linaro.org/PeterMaydell/QemuEmacsStyle)
> explicitly defines everything.

I'm afraid putting this into the source tree isn't as easy, because it
involves defining a new style, which you're not supposed do in
.dir-locals.el (it's for directory local variables, not for defining
global constants and calling functions).

So users would have to put the style definition in their .emacs, and its
use in .dir-locals.el.  If we then commit the latter to the repository,
we screw everybody who hasn't added the former to his .emacs.  No go.

We could try something like

    ((nil . ((indent-tabs-mode . nil)))
     (makefile-mode ((indent-tabs-mode . t)))
     (c-mode . ((c-file-style . (if (assoc "qemu" c-style-alist)
                                    "qemu" "stroustrup")))))

but that triggers the "contains values that may not be safe" prompt, so
it's another no go.

Let's see what Peter's style adds to "stroustrup", to gauge how much
trouble getting it would be worth:

(defconst qemu-c-style
  '(
    ;; recommend to do indent-tabs-mode separately to cover other major modes
    (indent-tabs-mode . nil)
    ;; same as stroustrup
    (c-basic-offset . 4)
    ;; this is the default, and anyone changing it is nuts
    (tab-width . 8)
    ;; default
    (c-comment-only-line-offset . 0)
    ;; duplicate entry, the one below wins, this one has no effect
    (c-hanging-braces-alist . ((substatement-open before after)))
    (c-offsets-alist . ((statement-block-intro . +)
                        (substatement-open . 0)
                        (label . 0)
                        (statement-cont . +)
			;; up to here same as stroustrup
			;; except we don't have (substatement-label . 0)
			;; and thus default to (substatement-label . 2)
			;;
			;; stroustrup has + instead of 0
			;; C++ "namespace" blocks
			;; do we care to differ from stroustrup?
                        (innamespace . 0)
			;; stroustrup has + instead of 0
			;; Brace that opens an in-class inline method
			;; do we care to differ from stroustrup?
                        (inline-open . 0)
                        ))
    ;; This isn't for indentation, it's for automatically inserting
    ;; newlines when you type braces in auto-newline minor mode.
    (c-hanging-braces-alist .
                            (
			     ;; same as stroustrup
			     (brace-list-open)
			     ;; only qemu
			     ;; First line in an enum or static array list
			     ;; suppress auto-newlines there
                             (brace-list-intro)
			     ;; only qemu
			     ;; Subsequent lines in an enum or static array
			     ;; suppress auto-newlines there
                             (brace-list-entry)
			     ;; only qemu
			     ;; Close brace of an enum or static array list.
			     ;; suppress auto-newlines there
                             (brace-list-close)
			     ;; same as stroustrup
                             (brace-entry-open)
			     ;; same as stroustrup
                             (block-close . c-snug-do-while)
			     ;; only qemu
			     ;; Brace that opens a class definition
			     ;; auto-newline after the brace
			     ;; stroustrup instead has
			     ;; (inexpr-class-open after)
			     ;; applies to anonymous inner classes in Java
                             (class-open . (after))
			     ;; same as stroustrup
                             (substatement-open . (after))
			     ;; only qemu
			     ;; Brace that opens a class definition
			     ;; suppress auto-newlines there
			     ;; stroustrup instead has
			     ;; (inexpr-class-close before)
			     ;; applies to anonymous inner classes in Java
                             (class-close)
			     ;; stroustrup additionally has
			     ;; A continuation of a C (or like) statement.
			     ;; (statement-cont)
			     ;; Brace that opens an "extern" block
			     ;; (extern-lang-open after)
			     ;; Likewise, C++ "namespace" block
			     ;; (namespace-open after)
			     ;; Likewise, CORBA IDL "module" block
			     ;; (module-open after)
			     ;; Likewise, CORBA CIDL "composition" block
			     ;; (composition-open after)
			     ;; Subsequent argument list lines when at
			     ;; least one argument follows on the same
			     ;; line as the arglist opening paren
			     ;; (arglist-cont-nonempty)
                             ))
    )
  "QEMU C Programming Style")

I can't find anything major.

Want me to post a formal patch adding my revised .dir-locals.el?

