Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVxE4-0002Kd-0L
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 02:35:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XVxDw-0002Ag-9N
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 02:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XVxDq-0004rE-5T
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 02:35:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XVxDd-0004q5-9A; Mon, 22 Sep 2014 02:35:29 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8M6ZLiN029334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 22 Sep 2014 02:35:21 -0400
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8M6ZIW8014123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 22 Sep 2014 02:35:20 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2162230403B0; Mon, 22 Sep 2014 08:35:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1411171901-13792-1-git-send-email-akong@redhat.com>
	<541D1D9A.6020100@redhat.com>
Date: Mon, 22 Sep 2014 08:35:18 +0200
In-Reply-To: <541D1D9A.6020100@redhat.com> (Paolo Bonzini's message of "Sat,
	20 Sep 2014 08:24:26 +0200")
Message-ID: <87lhpcw4bd.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: jen@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	aliguori@amazon.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom: suppress conscan
	warning of returning null point
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
X-List-Received-Date: Mon, 22 Sep 2014 06:35:54 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 20/09/2014 02:11, Amos Kong ha scritto:
>> Conscan complains about g_malloc0() and malloc() return null.

s/Conscan/Coverity/, both here and in subject.

>> 
>>   Error: NULL_RETURNS (CWE-476):
>>   qemu-kvm/qom/object.c:239: returned_null: Function
>> "g_malloc0(gsize)" returns null.
>>   qemu-kvm/qom/object.c:239: var_assigned: Assigning: "ti->class" =
>> null return value from "g_malloc0(gsize)".
>>   qemu-kvm/qom/object.c:249: dereference: Dereferencing a null
>> pointer "ti->class".
>> 
>> But if the passed size parameter is >= 1, then we can always get an
>> effective pointer, the warning disappears.
>
> The model should handle it:
>
> void *
> g_malloc0(size_t n_bytes)
> {
>     void *mem;
>     __coverity_negative_sink__(n_bytes);
>     mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
>     if (!mem) __coverity_panic__();
>     return mem;
> }
>
> So this patch means your coverity runs are misconfigured.

Yes.  I'm not sure we want the assertions anyway.

I use the following options with cov-analyze:

    -co BAD_FREE:allow_first_field:true
    -co DEADCODE:no_dead_default:true
    --security
    --concurrency
    --user-model-file scripts/coverity-model.xmldb
    --derived-model-file ~/work/glib/glib-2.38.2.xmldb

where glib-2.38.2.xmldb is produced by "cov-collect-models --dir cov -of
glib-2.32.4.xmldb" after a full Coverity scan of glib.

