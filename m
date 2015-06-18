Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5W7R-00074J-V3
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 05:28:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5W7Q-00070Q-1l
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 05:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5W7M-0002DA-Rl
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 05:28:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z5W7K-0002C7-6R; Thu, 18 Jun 2015 05:28:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D5BB52EBD1A;
	Thu, 18 Jun 2015 09:28:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5I9SBZJ018169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Jun 2015 05:28:13 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0B1E3303F904; Thu, 18 Jun 2015 11:28:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
Date: Thu, 18 Jun 2015 11:28:10 +0200
In-Reply-To: <CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
	(Peter Maydell's message of "Thu, 4 Jun 2015 14:41:42 +0100")
Message-ID: <87twu5z7px.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
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
X-List-Received-Date: Thu, 18 Jun 2015 09:28:21 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 4 June 2015 at 14:30, Daniel P. Berrange <berrange@redhat.com> wrote:
>> Some default emacs setups indent by 2 spaces and uses tabs
>> which is counter to the QEMU coding style rules. Adding a
>> .dir-locals.el file in the top level of the GIT repo will
>> inform emacs about the QEMU coding style, and so assist
>> contributors in avoiding common style mistakes before
>> they submit patches.
>>
>> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
>> ---
>>  .dir-locals.el | 2 ++
>>  1 file changed, 2 insertions(+)
>>  create mode 100644 .dir-locals.el
>>
>> diff --git a/.dir-locals.el b/.dir-locals.el
>> new file mode 100644
>> index 0000000..3ac0cfc
>> --- /dev/null
>> +++ b/.dir-locals.el
>> @@ -0,0 +1,2 @@
>> +((c-mode . ((c-file-style . "stroustrup")
>> +           (indent-tabs-mode . nil))))
>
> My .emacs defines a style like this:
>
> (defconst qemu-c-style
>   '((indent-tabs-mode . nil)
>     (c-basic-offset . 4)
>     (tab-width . 8)
>     (c-comment-only-line-offset . 0)
>     (c-offsets-alist . ((statement-block-intro . +)
>                         (substatement-open . 0)
>                         (label . 0)
>                         (statement-cont . +)
>                         (innamespace . 0)
>                         (inline-open . 0)
>                         ))
>     (c-hanging-braces-alist .
>                             ((brace-list-open)
>                              (brace-list-intro)
>                              (brace-list-entry)
>                              (brace-list-close)
>                              (brace-entry-open)
>                              (block-close . c-snug-do-while)
>                              ;; structs have hanging braces on open
>                              (class-open . (after))
>                              ;; ditto if statements
>                              (substatement-open . (after))
>                              ;; and no auto newline at the end
>                              (class-close)
>                              ))
>     )
>   "QEMU C Programming Style")
>
> which is a superset of Stroustrup and gets a few more
> corner cases right, I think.

Trouble is I can't figure out how to get that into Emacs using nothing
but files in the QEMU tree.  From within the tree, we can file- and
directory-local variables, and it just works as long as Emacs deems the
variables safe.  When not, Emacs prompts for confirmation.  I'd rather
not go there.

Using an existing C style is a textbook example of safe local variables
(literally, the Emacs manual does it).

Adding simple customizations on top should be feasible.

However, I can't see how I could define a new C style there without
pushing the "local variables" feature well beyond its intended use, and
triggering the confirmation prompts.

If we take Dan's patch, every Emacs user who hasn't already configured a
suitable style profits.  Users who have may have to adjust their
configuration to work with or around Dan's patch.

"That action is best which procures the greatest happiness for the
greatest numbers."  Let's take Dan's patch.

I can post a follow-up extending tab avoidance to files that don't use
c-mode.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

