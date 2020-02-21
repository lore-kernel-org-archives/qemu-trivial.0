Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5BLv-0004yX-Ne
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 11:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j5BLt-0004w3-9a
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 11:40:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j5BLs-0004aG-5U
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 11:40:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32052
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j5BLs-0004ZM-0a
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 11:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582303230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5m45+iI9fwusuKb+VopaNjfyolvGlQWvmOpBl4B9YxI=;
 b=gOolDmfVWyHxFIuBZikVkuWYrgaBnO2xsJldODN80cIs15wcAkcjYus3+2zzMQB8HtY7Xp
 43C5puxxbjIfxRMMKfZdSnXUYH69dnNifi7tU6OGLpjTa5q6Mo/ZH2ulno7KMyrp0jDHJh
 jRNL7dmmazrIj0GGEvbfIcTOMlxPVcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-vcnuk47LNzKZ1oLgC4uIKw-1; Fri, 21 Feb 2020 11:40:28 -0500
X-MC-Unique: vcnuk47LNzKZ1oLgC4uIKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94ECA107ACC5;
 Fri, 21 Feb 2020 16:40:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B988B570;
 Fri, 21 Feb 2020 16:40:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D964411386A6; Fri, 21 Feb 2020 17:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH] maint: Include top-level *.rst files early in git diff
References: <20200220162214.3474280-1-eblake@redhat.com>
 <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
Date: Fri, 21 Feb 2020 17:40:25 +0100
In-Reply-To: <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
 (Peter Maydell's message of "Fri, 21 Feb 2020 10:17:36 +0000")
Message-ID: <87wo8f51xi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2020 16:40:34 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 20 Feb 2020 at 16:22, Eric Blake <eblake@redhat.com> wrote:
>>
>> We are converting more doc files to *.rst rather than *.texi.  Most
>> doc files are already listed early in diffs due to our catchall
>> docs/*, but a few top-level files get missed by that glob.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Both *.texi and *.rst entries make sense while we are still converting
>> things, but we'll need a followup to drop *.texi when the conversion
>> is complete...
>
> I was wondering what rst files we had outside docs, and
> the answer is "README.rst, CODING_STYLE.rst and
> tests/acceptance/README.rst".
>
> (There's a reasonable argument for moving CODING_STYLE.rst to
> docs/devel now; depends how highly you rate having it more
> "discoverable" to new contributors.)

The little cynic in the back of my head cackles and points out that
CODING_STYLE.rst exists not for new contributors to discover, but so
that old contributors have something to smack on new heads.

SCNR :)


