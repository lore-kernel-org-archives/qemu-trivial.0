Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDDSo-00067l-WF
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 13:19:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dDDSm-00066D-C4
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 13:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dDDSk-0005d2-Sr
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 13:19:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dDDSe-0005cI-R4; Tue, 23 May 2017 13:19:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAE8490907;
	Tue, 23 May 2017 17:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AAE8490907
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com AAE8490907
Received: from [10.18.17.130] (dhcp-17-130.bos.redhat.com [10.18.17.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16E2017133;
	Tue, 23 May 2017 17:19:00 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: famz@redhat.com, qemu-trivial@nongnu.org, armbru@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
References: <149546869825.1005.10210133978512879518@c05f1edc8ed1>
	<48dfeca5-0640-796f-66ce-8cab198fcaef@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e0378263-a6fe-4a51-d345-279baf478c2e@redhat.com>
Date: Tue, 23 May 2017 13:19:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <48dfeca5-0640-796f-66ce-8cab198fcaef@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 May 2017 17:19:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tests/libqtest: Print
 error instead of aborting when env variable is missing
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 23 May 2017 17:19:18 -0000



On 05/23/2017 03:25 AM, Thomas Huth wrote:
> On 22.05.2017 17:58, no-reply@patchew.org wrote:
>> This series failed automatic build test. Please find the testing comma=
nds and
>> their output below. If you have docker installed, you can probably rep=
roduce it
>> locally.
> [...]
>> 	 LEX convert-dtsv0-lexer.lex.c
>> 	 DEP /tmp/qemu-test/src/dtc/fdtdump.c
>> make[1]: flex: Command not found
>> 	 BISON dtc-parser.tab.c
>> make[1]: bison: Command not found
>> 	 DEP /tmp/qemu-test/src/dtc/srcpos.c
>> 	 LEX dtc-lexer.lex.c
>> make[1]: flex: Command not found
>> 	 DEP /tmp/qemu-test/src/dtc/treesource.c
>> 	 DEP /tmp/qemu-test/src/dtc/livetree.c
>> 	 DEP /tmp/qemu-test/src/dtc/fstree.c
>> 	 DEP /tmp/qemu-test/src/dtc/flattree.c
>> 	 DEP /tmp/qemu-test/src/dtc/dtc.c
>> 	 DEP /tmp/qemu-test/src/dtc/data.c
>> 	 DEP /tmp/qemu-test/src/dtc/checks.c
>> 	CHK version_gen.h
>> 	 BISON dtc-parser.tab.c
>> make[1]: bison: Command not found
>> 	 LEX convert-dtsv0-lexer.lex.c
>> 	UPD version_gen.h
>> make[1]: flex: Command not found
>> 	 LEX dtc-lexer.lex.c
>> make[1]: flex: Command not found
>> 	 DEP /tmp/qemu-test/src/dtc/util.c
>> 	 LEX convert-dtsv0-lexer.lex.c
>> 	 BISON dtc-parser.tab.c
>> make[1]: flex: Command not found
>> make[1]: bison: Command not found
>> 	 LEX dtc-lexer.lex.c
>> make[1]: flex: Command not found
>=20
> Looks like flex and bison are missing in the docker image? Could someon=
e
> please add it?
>=20
> [...]
>>   CC      replay/replay-internal.o
>> /tmp/qemu-test/src/replay/replay-internal.c: In function =E2=80=98repl=
ay_put_array=E2=80=99:
>> /tmp/qemu-test/src/replay/replay-internal.c:65: warning: ignoring retu=
rn value of =E2=80=98fwrite=E2=80=99, declared with attribute warn_unused=
_result
>=20
> I guess that should be fixed?
>=20
> [...]
>>   CC      slirp/tcp_input.o
>>   CC      slirp/tcp_output.o
>>   CC      slirp/tcp_subr.o
>>   CC      slirp/tcp_timer.o
>> /tmp/qemu-test/src/slirp/tcp_input.c: In function =E2=80=98tcp_input=E2=
=80=99:
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_p=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_len=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_tos=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_id=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_off=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_ttl=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_sum=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_src.s_addr=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip=
_dst.s_addr=E2=80=99 may be used uninitialized in this function
>> /tmp/qemu-test/src/slirp/tcp_input.c:220: warning: =E2=80=98save_ip6.i=
p_nh=E2=80=99 may be used uninitialized in this function
>=20
> I've never seen these warnings in tcp_input.c before ... and they also
> look like false positives too me ... is that GCC in the docker image to=
o
> sensitive?
>=20
> [...]
>>   CC      aarch64-softmmu/hw/timer/exynos4210_rtc.o
>> /tmp/qemu-test/src/hw/i386/pc_piix.c: In function =E2=80=98igd_passthr=
ough_isa_bridge_create=E2=80=99:
>> /tmp/qemu-test/src/hw/i386/pc_piix.c:1067: warning: =E2=80=98pch_rev_i=
d=E2=80=99 may be used uninitialized in this function
>=20
> dito
>=20
>>   CC      aarch64-softmmu/hw/usb/tusb6010.o
>> /tmp/qemu-test/src/hw/i386/acpi-build.c: In function =E2=80=98build_ap=
pend_pci_bus_devices=E2=80=99:
>> /tmp/qemu-test/src/hw/i386/acpi-build.c:525: warning: =E2=80=98notify_=
method=E2=80=99 may be used uninitialized in this function
>=20
> dito
>=20
> [...]
>> /tmp/qemu-test/src/tests/ide-test.c: In function =E2=80=98cdrom_pio_im=
pl=E2=80=99:
>> /tmp/qemu-test/src/tests/ide-test.c:803: warning: ignoring return valu=
e of =E2=80=98fwrite=E2=80=99, declared with attribute warn_unused_result
>> /tmp/qemu-test/src/tests/ide-test.c: In function =E2=80=98test_cdrom_d=
ma=E2=80=99:
>> /tmp/qemu-test/src/tests/ide-test.c:899: warning: ignoring return valu=
e of =E2=80=98fwrite=E2=80=99, declared with attribute warn_unused_result
>=20
> Needs a patch, I guess?
>=20

Huh, I've never seen these come up locally, I'll send a patch (if only
to quiet patchew.)

>>   GTESTER tests/test-vmstate
>> Failed to load simple/primitive:b_1
>> Failed to load simple/primitive:i64_2
>> Failed to load simple/primitive:i32_1
>> Failed to load simple/primitive:i32_1
>> Failed to load test/with_tmp:a
>> Failed to load test/tmp_child_parent:f
>> Failed to load test/tmp_child:parent
>> Failed to load test/with_tmp:tmp
>> Failed to load test/tmp_child:diff
>> Failed to load test/with_tmp:tmp
>> Failed to load test/tmp_child:diff
>> Failed to load test/with_tmp:tmp
>=20
> That works for me when I run "make check" locally ... could my patch
> have broken this, or is there something else wrong in the repository or
> docker image?
>=20
> [...]
>>   GTESTER tests/test-qga
>>   GTESTER tests/test-timed-average
>>   GTESTER tests/test-io-task
>>   GTESTER tests/test-io-channel-socket
>>   GTESTER tests/test-io-channel-file
>>   GTESTER tests/test-io-channel-command
>>   GTESTER tests/test-io-channel-buffer
>>   GTESTER tests/test-base64
>>   GTESTER tests/test-crypto-ivgen
>>   GTESTER tests/test-crypto-afsplit
>>   GTESTER tests/test-crypto-xts
>>   GTESTER tests/test-crypto-block
>>   GTESTER tests/test-logging
>>   GTESTER tests/test-replication
>>   GTESTER tests/test-bufferiszero
>>   GTESTER tests/test-uuid
>>   GTESTER tests/ptimer-test
>>   GTESTER tests/test-qapi-util
>>   GTESTER check-qtest-x86_64
>>   GTESTER check-qtest-aarch64
>>   GTESTER tests/test-qobject-output-visitor
>>   GTESTER tests/test-clone-visitor
>>   GTESTER tests/test-qobject-input-visitor
>>   GTESTER tests/test-qmp-commands
>>   GTESTER tests/test-string-input-visitor
>>   GTESTER tests/test-string-output-visitor
>>   GTESTER tests/test-qmp-event
>>   GTESTER tests/test-opts-visitor
>>   GTESTER tests/test-qht-par
>> qemu-system-aarch64: warning: CPU(s) not present in any NUMA nodes: CP=
U 2 [thread-id: 2], CPU 3 [thread-id: 3], CPU 6 [thread-id: 6], CPU 7 [th=
read-id: 7]
>> qemu-system-aarch64: warning: All CPU(s) up to maxcpus should be descr=
ibed in NUMA config, ability to start up with partial NUMA mappings is ob=
soleted and will be removed in future
>> **
>> ERROR:/tmp/qemu-test/src/tests/test-qga.c:894:test_qga_guest_exec: ass=
ertion failed: (exited)
>> GTester: last random seed: R02S88fe048bce3aa693228ab12699fc6771
>> make: *** [check-tests/test-qga] Error 1
>> make: *** Waiting for unfinished jobs....
>=20
> I also can not reproduce this here when running "make check". I also ca=
n
> not see how this should be related to my patch ... could it be that the
> docker image was simply running into some time out problems here 'cause
> the server was overloaded? In that case we should maybe increase the
> timeout value in test_qga_guest_exec() ?
>=20
>  Thomas
>=20
>=20

