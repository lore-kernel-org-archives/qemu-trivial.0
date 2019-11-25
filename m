Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZGKj-0001wu-Ky
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2019 10:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iZGKg-0001sa-Cp
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 10:31:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iZGKf-0004od-96
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 10:31:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33039
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iZGKf-0004oY-5D
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 10:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574695880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqmrMZ9j3UPDh+jr7UoW8w/rCeSfyPb1dUZsTJOTGfc=;
 b=AKPhM01S/h3+m4P9nWu+tlplpE1kcVYWm7jYtcKELPhgAJepISmJ35XOXhoQzUDkAFyncK
 /9HE3zzLdC8LbW/qTmFlNZrinU2UXE1ZXHXT4eFB3g41r8rtMAnQVGyYdvNpPC3Szy5DS4
 VZZt+r1FQEtUQ64SjJ0lttcJUwcRyv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-uIOkWZItOZ-0Zv84v-0Jag-1; Mon, 25 Nov 2019 10:31:17 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62091188352A;
 Mon, 25 Nov 2019 15:31:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 085151001B03;
 Mon, 25 Nov 2019 15:31:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48D3C1138606; Mon, 25 Nov 2019 16:31:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  tao3.xu@intel.com
Subject: Re: [PATCH 2/2] test-keyval: Tighten test of trailing crap after size
References: <20191125133846.27790-1-armbru@redhat.com>
 <20191125133846.27790-3-armbru@redhat.com>
 <b06f7807-b201-5a52-5a62-b50f52cc4d44@redhat.com>
Date: Mon, 25 Nov 2019 16:31:14 +0100
In-Reply-To: <b06f7807-b201-5a52-5a62-b50f52cc4d44@redhat.com> (Eric Blake's
 message of "Mon, 25 Nov 2019 08:29:54 -0600")
Message-ID: <87fticdlbx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: uIOkWZItOZ-0Zv84v-0Jag-1
X-Mimecast-Spam-Score: 0
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
X-List-Received-Date: Mon, 25 Nov 2019 15:31:24 -0000

Eric Blake <eblake@redhat.com> writes:

> On 11/25/19 7:38 AM, Markus Armbruster wrote:
>> test_keyval_visit_size() should test for trailing crap after size with
>> and without suffix.  It does test the latter: "sz2=3D16Gi" has size
>> "16G" followed by crap "i".  It fails to test the former "sz1=3D16E" is
>> a syntactically valid size that overflows uint64_t.  Replace by
>> "sz1=3D0Z".
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   tests/test-keyval.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
>> index 09b0ae3c68..e331a84149 100644
>> --- a/tests/test-keyval.c
>> +++ b/tests/test-keyval.c
>> @@ -478,7 +478,7 @@ static void test_keyval_visit_size(void)
>>       visit_free(v);
>>         /* Trailing crap */
>> -    qdict =3D keyval_parse("sz1=3D16E,sz2=3D16Gi", NULL, &error_abort);
>> +    qdict =3D keyval_parse("sz1=3D0Z,sz2=3D16Gi", NULL, &error_abort);
>
> Does this actually test both failure cases, or does it abort the parse
> after the first failure (sz1=3D0Z) without ever hitting the second half
> of the parse (sz2=3D16Gi)?

Fair question!  Short answer: yes, we check both.

Long answer follows.

       /* Trailing crap */
       qdict =3D keyval_parse("time1=3D89ks,time2=3Dns", NULL, &error_abort=
);

keyval_parse() must succeed: it takes &error_abort.

        v =3D qobject_input_visitor_new_keyval(QOBJECT(qdict));
        qobject_unref(qdict);

Can't fail.

        visit_start_struct(v, NULL, NULL, 0, &error_abort);

Must succeed.

        visit_type_size(v, "sz1", &sz, &err);
        error_free_or_abort(&err);

This is where we parse "0Z".  Must fail.  We continue.

        visit_type_size(v, "sz2", &sz, &err);
        error_free_or_abort(&err);

This is where we parse "16Gi".  Must fail.  We continue.

        visit_end_struct(v, NULL);
        visit_free(v);
    }

Clear now?


