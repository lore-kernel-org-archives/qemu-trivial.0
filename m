Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5Ed7-0003ie-0Q
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 15:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j5Ed3-0003a8-JY
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 15:10:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j5Ed2-0007zm-Ev
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 15:10:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25369
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j5Ed2-0007zU-B7
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 15:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582315827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WasyKTLNX156llRoyrshOAOea3ULgaG5bG4wy7/RODk=;
 b=ZhsMC/4au6YX2rILquqfF/5xoiVZtzZ47EB8HDqMBo2Gv/ttncPJb5rV0wtZL3vy1LDI4Z
 pPI+MRoFCl3hEKAyWURCyRrwYYlBrTs86PjPPT+5paQz2QamEHERibRYDMVsDuTKkOfiMb
 kXP/+vtHnMKpt/T8fcskchgdfPE45e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-7_2tcSxqOXeMiokG8e6nuQ-1; Fri, 21 Feb 2020 15:10:24 -0500
X-MC-Unique: 7_2tcSxqOXeMiokG8e6nuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9B3C100DFC7;
 Fri, 21 Feb 2020 20:10:22 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91B5860499;
 Fri, 21 Feb 2020 20:10:22 +0000 (UTC)
Subject: Re: [PATCH] maint: Include top-level *.rst files early in git diff
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200220162214.3474280-1-eblake@redhat.com>
 <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7ffc8c30-020e-ebcc-94d9-70ced216352f@redhat.com>
Date: Fri, 21 Feb 2020 08:33:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 21 Feb 2020 20:10:31 -0000

On 2/21/20 4:17 AM, Peter Maydell wrote:
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

Or even:
git mv CODING_STYLE.rst docs/devel/CODING_STYLE.rst
ln -s docs/devel/CODING_STYLE.rst .
git add CODING_STYLE.rst

to turn it into a git link in the top level for easy discoverabilty on a 
fresh checkout, while still making it part of our overall built 
documentation.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


