Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb3mj-0005VA-8p
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 10:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kb3mh-0005Sr-AK
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 10:36:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kb3mf-0004HM-P1
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 10:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604676972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lgTrA8TQSVbtwoYRzbX/NZ9w7v5/Cl1dMgEup0zEMg=;
 b=WRv8yL+jepI6EQso1lftX4RUUUzV9dHesQ+JM5zusMUtec1U5kCc8Bhk8B97LMb8oUci0A
 18t46KiFzbCOMMo7uD+thlx0jvTu2Q1yi+0QTgvY6yL7RW3YbVY76Itq8QNvxt3zN7GLuU
 ynRrFoOg8vaxEllArJXuGSFbN/so42Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-94sl_GDHPXqBcWcX9W_j6g-1; Fri, 06 Nov 2020 10:36:08 -0500
X-MC-Unique: 94sl_GDHPXqBcWcX9W_j6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA8FAF9AA;
 Fri,  6 Nov 2020 15:36:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52BD05B4DD;
 Fri,  6 Nov 2020 15:36:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D90FB1132BD6; Fri,  6 Nov 2020 16:36:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  AlexChen <alex.chen@huawei.com>,
 lvivier@redhat.com,  QEMU Trivial <qemu-trivial@nongnu.org>,  QEMU
 <qemu-devel@nongnu.org>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qtest: Fix bad printf format specifiers
References: <5FA28117.3020802@huawei.com>
 <67eca43e-99ea-f2ce-5d9e-a9cb5c7a3a83@redhat.com>
 <5FA38A32.2020008@huawei.com>
 <18690aa2-3de9-70ad-477f-934724b284a0@redhat.com>
 <87wnyzouy4.fsf@dusky.pond.sub.org>
 <1fd5965d-cf5e-b41b-2029-bd3e52c3e498@redhat.com>
Date: Fri, 06 Nov 2020 16:36:05 +0100
In-Reply-To: <1fd5965d-cf5e-b41b-2029-bd3e52c3e498@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 6 Nov 2020 15:18:06
 +0100")
Message-ID: <87ft5mh50a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 06 Nov 2020 15:36:15 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/6/20 7:33 AM, Markus Armbruster wrote:
[...]
>> In other words "%" PRIu32 is just a less legible alias for "%u" in all
>> cases that matter.
>
> Can we add a checkpatch rule to avoid using 'PRI[dux]32' format,
> so it is clear for everyone?

I guess we could, but *I* can't: -ENOTIME, sorry.


